<style>
.survey-display .v-expansion-panel__header {
    padding: unset;
    height: unset;
}
.survey-display .v-list__tile {
    padding: unset;
}
.survey-display .v-list__tile__action {
    min-width: unset;
    align-items: unset;
}
.survey-display .content1 {
    min-width: 7em;
    flex-basis: 0;
    flex-grow: 1;
}
.survey-display .content2 {
    flex-basis: 0;
    flex-grow: 2;
}
</style>

<template>

<v-expansion-panel class="survey-display">

    <v-expansion-panel-content hide-actions lazy>
            <v-list-tile slot="header" :class="[color, 'lighten-5']">
                <v-list-tile-action>
                        <v-icon class="mx-2">keyboard_arrow_down</v-icon>
                </v-list-tile-action>
                <v-list-tile-content class="content1">
                        <v-list-tile-title class="title black--text font-weight-thin">{{survey_package.name}}</v-list-tile-title>
                        <v-list-tile-sub-title class="caption">{{num_responses}} Responses</v-list-tile-sub-title>
                </v-list-tile-content>
                <v-list-tile-content class="content2">
                        <ResponseSummary v-bind:responses="survey_package.questions"></ResponseSummary>
                </v-list-tile-content>
                <v-list-tile-action class="pa-2">
                    <v-list-tile-action-text v-if="survey_package.override_token">Token:</v-list-tile-action-text>
                    <v-list-tile-action-text v-if="survey_package.override_token">{{survey_package.override_token}}</v-list-tile-action-text>
                </v-list-tile-action>
                <v-list-tile-action v-if="is_instance && closed_date">
                        <v-list-tile-action-text>
				{{closed_text}}:
                        </v-list-tile-action-text>
                        <v-list-tile-action-text>
                            {{closed_date}}
                        </v-list-tile-action-text>
                </v-list-tile-action>
                <v-list-tile-action>
                        <v-list-tile-action-text class="ma-1">
                                <!-- <v-btn flat class="grey--text" @click="buttonClick($event, 'clone')">Clone</v-btn> -->
                                <v-btn v-if="!is_instance" flat class="grey--text" @click="buttonClick($event, 'edit')">Edit</v-btn>
                                <v-btn v-if="!is_instance" flat class="grey--text" @click="buttonClick($event, 'launch')">Launch</v-btn>
                        </v-list-tile-action-text>
                </v-list-tile-action>
            </v-list-tile>
            <v-card class="grey lighten-4 px-1 py-2">
                <v-card color="blue" dark class="text-xs-center title"><v-card-text>{{survey_package.name}}</v-card-text></v-card>
                 <ResponseSummary v-bind:responses="survey_package.questions" :compact="false"></ResponseSummary>
            </v-card>
    </v-expansion-panel-content>

</v-expansion-panel>

</template>

<script>
import ResponseSummary from "./response_summary.vue";
export default {
    name: "SurveyDisplay",
    props: ["survey_package", "is_instance", "color"],
    methods: {
        buttonClick: function(e, action) {
            // prevent the expansion-panel from expanding.
            e.stopPropagation();
            this.$emit(action, Object.assign({}, this.survey_package));
        }
    },
    computed: {
        closed_date: function() {
            let formatted_date = "";
            try {
                formatted_date = new Date(this.survey_package.timedate_close)
                    .toISOString()
                    .slice(0, 10);
            } catch (e) {}
            return formatted_date;
        },
        /**
         * Returns the word "Closed" or "Closes" depending on whether the close date
         * is in the future.
         */
        closed_text: function() {
            if (new Date(this.survey_package.timedate_close) > new Date()) {
                return "Closes";
            } else {
                return "Closed";
            }
        },
        num_responses: function() {
            let lengths = this.survey_package.questions.map(
                x => (x.responses || []).length
            );
            let ret = Math.max(0, ...lengths);
            return ret;
        }
    },
    components: {
        ResponseSummary
    }
};
</script>
