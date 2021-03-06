<?php
/*
 * This file contains functions that return specific POST SQL queries
 * to be used for operating the database.
 */

/**
 * This function is for generating SQL statements that can update the user info
 * @param action:string add_or_update/delete
 * @return string An SQL statement
 */
function gen_query_update_user_info($action)
{
    // If the user wants to delete a specific instance
    if ($action == "delete") {
        return "DELETE FROM users WHERE user_id=:user_id;";
    } else {
        // If the user wants to add or update
        $sql =
            "INSERT INTO users (user_id, name, photo) VALUES " .
            "(:user_id, :name, :photo) ON DUPLICATE KEY UPDATE name = :name" .
            ", photo = :photo;";
        return $sql;
    }
}

function gen_query_survey_instace_by_token()
{
    return "SELECT override_token from survey_instances WHERE override_token = :override_token";
}

/* --------------below are the query generators of survey setting---------------- */

/**
 * Get all columns from the survey's table by survey_id.
 */
function gen_query_survey_get_all()
{
    return "SELECT * FROM surveys WHERE survey_id = :survey_id";
}

/**
 * Given column names in `$cols`, generate a query to update those
 * cols based on a survey_id. Variables should be bound to the column
 * names proveded in $cols.
 *
 * @param $cols: List of strings. e.g. ["name", "term"]
 */
function gen_query_update_survey_col($cols)
{
    $cols_array = [];
    foreach ($cols as $col) {
        $cols_array[] = "$col = :$col";
    }
    $cols_str = implode(", ", $cols_array);

    return "UPDATE surveys SET $cols_str WHERE survey_id = :survey_id";
}

/**
 * Returns a sequence of queries to be executed to remove all references to
 * a survey by survey_id. This includes all responses and survey instances.
 */
function gen_query_delete_survey()
{
    return [
        "DELETE FROM responses WHERE survey_instance_id IN (
		SELECT survey_instance_id FROM survey_instances
		WHERE survey_id = :survey_id
	)",
        "DELETE FROM survey_instances WHERE survey_id = :survey_id;",
        "DELETE FROM surveys WHERE survey_id = :survey_id; "
    ];
}

function gen_query_get_choices_by_level($level)
{
    switch ($level) {
        case "dept":
            $table_name = "dept_survey_choices";
            break;
        case "course":
            $table_name = "course_survey_choices";
        case "section":
        case "ta":
            $table_name = "ta_survey_choices";
            break;
    }
    return (
        "SELECT choices.choice1, choices.choice2, choices.choice3, choices.choice4, choices.choice5, choices.choice6 FROM (choices " .
        "JOIN $table_name ON $table_name.choices_id = choices.choices_id) " .
        "WHERE $table_name.id = :id"
    );
}

/**
 * Generate queries to clone choices rows. If `$level` is set,
 * the query will clone *_survey_choices (where * corresponds to $level).
 * If `$level` is not set, the query will clone a row from the `choices`
 * table.
 */
function gen_query_clone_choices($level = null)
{
    switch ($level) {
        case "dept":
            return (
                "INSERT INTO dept_survey_choices (choices_id, department_name, user_id)" .
                "SELECT choices_id, department_name, user_id FROM dept_survey_choices WHERE id = :id"
            );
        case "course":
            return (
                "INSERT INTO course_survey_choices (choices_id, course_code, user_id) " .
                "SELECT choices_id, course_code, user_id FROM course_survey_choices WHERE id = :id"
            );
        case "section":
        case "ta":
            return (
                "INSERT INTO ta_survey_choices (choices_id, section_id, user_id) " .
                "SELECT choices_id, section_id, user_id FROM ta_survey_choices WHERE id = :id"
            );
        default:
            return (
                "INSERT INTO choices (choice1, choice2, choice3, choice4, choice5, choice6) " .
                "SELECT choice1, choice2, choice3, choice4, choice5, choice6 FROM choices WHERE choices_id = :id"
            );
    }
}

/**
 * Get the choices_id of the choices referenced by
 * *_survey_chioces of a particular level.
 */
function gen_query_get_choices_id_by_level($level)
{
    switch ($level) {
        case "dept":
            return "SELECT choices_id FROM dept_survey_choices WHERE id = :id";
        case "course":
            return "SELECT choices_id FROM course_survey_choices WHERE id = :id";
        case "section":
        case "ta":
            return "SELECT choices_id FROM ta_survey_choices WHERE id = :id";
    }
}

/**
 * Set the choices_id of the choices referenced by
 * *_survey_chioces of a particular level.
 */
function gen_query_set_choices_id_by_level($level)
{
    switch ($level) {
        case "dept":
            return "UPDATE dept_survey_choices SET choices_id = :choices_id WHERE id = :id";
        case "course":
            return "UPDATE course_survey_choices SET choices_id = :choices_id WHERE id = :id";
        case "section":
        case "ta":
            return "UPDATE ta_survey_choices SET choices_id = :choices_id WHERE id = :id";
    }
}

/**
 * Return an SQL statement for updating the choices inside a choice instance
 * @return string
 */
function gen_query_update_choice()
{
    return (
        "UPDATE choices SET choice1 = :choice1, choice2 = :choice2, choice3 = :choice3" .
        ", choice4 = :choice4, choice5 = :choice5, choice6 = :choice6 WHERE choices_id = :choices_id;"
    );
}

/**
 * Return the last id generated by an insert.
 */
function gen_query_get_last()
{
    return "SELECT LAST_INSERT_ID();";
}

/**
 * Insert 6 choices into the choices table.
 */
function gen_query_insert_new_choices()
{
    return (
        "INSERT INTO choices (choice1, choice2, choice3, choice4, choice5, choice6)" .
        " VALUES (:choice1, :choice2, :choice3, :choice4, :choice5, :choice6);"
    );
}

/**
 * Return an SQL statement that will ge back the id of dept_survey_choices,
 * course_survey_choices and ta_survey_choices for use when branching a new survey
 * @param survey_id:int The id of the survey
 */
function gen_query_get_survey_choice($survey_id)
{
    return (
        "SELECT dept_survey_choice_id, course_survey_choices, ta_survey_choices FROM surveys " .
        "WHERE survey_id = :survey_id;"
    );
}

/**
 * Insert a new *_survey_choices where * is determined by `$level`.
 * The names of the bound variables are standardized with `choices_id`,
 * `user_id`, and `ref_id` where `ref_id` should be bound to
 * [course_code, section_id, department_name] as appropriate.
 */
function gen_query_insert_new_survey_choices($level)
{
    switch ($level) {
        case "dept":
            return (
                "INSERT INTO dept_survey_choices (choices_id, department_name, user_id)" .
                " VALUES (:choices_id, :ref_id, :user_id);"
            );
            break;
        case "course":
            return (
                "INSERT INTO course_survey_choices (choices_id, course_code, user_id)" .
                " VALUES (:choices_id, :ref_id, :user_id);"
            );
            break;
        case "section":
        case "ta":
            return (
                "INSERT INTO ta_survey_choices (choices_id, section_id, user_id)" .
                " VALUES (:choices_id, :ref_id, :user_id);"
            );
            break;
    }
}

/**
 * Return an SQL statement for creating new survey
 * @return string
 */
function gen_query_set_new_survey()
{
    return (
        "INSERT INTO surveys (dept_survey_choice_id, course_survey_choice_id, " .
        "ta_survey_choice_id, name, term, default_survey_open, default_survey_close) " .
        "VALUES (:dept_survey_choice_id, :course_survey_choice_id, :ta_survey_choice_id, " .
        ":name, :term, :default_survey_open, :default_survey_close);"
    );
}

/* ----------------------------------------------------------------------------------- */

/**
 * This function is for generating SQL statements that can update the profs/tas for
 * one particular course or section
 * @param action:string whether the user wants to add/update or delete
 * @return string An SQL statement
 */
function gen_query_update_user_association($action)
{
    // If the user wants to add an user association
    if ($action == "add_or_update") {
        return (
            "INSERT INTO user_associations (user_id, course_code, section_id) VALUES (" .
            ":user_id, :course_code, :section_id);"
        );
    } else {
        // If the user wants to delete one user association
        return (
            "DELETE FROM user_associations WHERE user_id = :user_id" .
            " AND course_code = :course_code AND section_id = :section_id;"
        );
    }
}

/* ------------------------------------------------------------------------------------------- */

/**
 * This function is for generating SQL statements that can update courses or
 * sections for a specific term
 * @param action:string whether the user wants to add/update or delete
 * @param section:object including term, section_code, section_id
 * @return string An SQL statement
 */
function gen_query_update_courses_sections($action, $section)
{
    $sql_array = array();
    /* If the user wants to add or update one course/section.*/
    if ($action == "add_or_update") {
        // 1. Insert otherwise update the courses table with this course object
        $sql_course =
            "INSERT INTO courses VALUES (:course_code, :course_title, :department_name) ON DUPLICATE KEY UPDATE title = " .
            ":course_title, department_name = :department_name;";
        $sql_section = '';
        // 2. Insert otherwise update the sections table with this section object
        if ($section["section_id"] == null) {
            // Insert if the section id is null
            $sql_section =
                "INSERT INTO sections (course_code, term, section_code) VALUES (" .
                ":course_code, :term, :section_code);";
        } else {
            // Update if it has a specific section id
            $sql_section =
                "UPDATE sections SET course_code = :course_code, term = " .
                ":term, section_code = :section_code WHERE section_id = :section_id;";
        }
        array_push($sql_array, $sql_course, $sql_section, null);
    } else {
        /* If the user wants to delete one course/section. */
        /* If the user wants to delete one section under a specific course. */
        if ($section != null) {
            // 1. Delete the section instances with this specific "section_id"
            $sql_section =
                "DELETE FROM sections WHERE section_id = :section_id;";
            // 2. Delete the user associations with this specific "section_id"
            $sql_user_association =
                "DELETE FROM user_associations WHERE section_id = :section_id;";
            array_push($sql_array, $sql_section, $sql_user_association, null);
        } else {
            /* If the user wants to delete a course with all the sections of it. */
            // 1. Delete the course with "course_code" from the courses table
            $sql_course =
                "DELETE FROM courses WHERE course_code = :course_code;";
            // 2. Delete the section with "course_code" from the sections table
            $sql_section =
                "DELETE FROM sections WHERE course_code = :course_code;";
            // 3. Delete the user association with "course_code" from the user_associations table
            $sql_user_association =
                "DELETE FROM user_associations WHERE course_code = :course_code;";
            array_push(
                $sql_array,
                $sql_user_association,
                $sql_section,
                $sql_course
            );
        }
    }
    return $sql_array;
}
