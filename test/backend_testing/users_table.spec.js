const chai = require("chai");
const chaiHttp = require("chai-http");
chai.use(chaiHttp);
const expect = chai.expect;

describe("Test User Table", function() {
    before(function() {
        console.log("Should reset Database");
    });
    describe("Test GET request", function() {
        it("should return a set of", async function() {
            let fetched = await fetch(
                "http://localhost:3000/api.php?url=users"
            );
            expect(fetched).to.have.status(200);
            let fetchedJSON = await fetched.json();
        });
        it("get a user with specific utorid", async function() {
            let fetched = await fetch(
                "http://localhost:3000/api.php?url=users%2Fabcd1000"
            );
            expect(fetched).to.have.status(200);
            let fetchedJSON = await fetched.json();
        });
    });
    describe("Test POST request", function() {

        it("should create a specific user given correct url and data", async function() {
            let fetched = await fetch("http://localhost:3000/api.php", {
                method: "POST",
                headers: { 'content-type': 'application/json'},
                body: JSON.stringify({
                    url: "users",
                    data: {
                        utorid: "123",
                        type: "admin",
                        name: "TROLL",
                        photo: "DAN"
                    }
                })
            });
            expect(fetched).to.have.status(202);

            let fetchedJSON = await fetched.json();
        });
        after(async function() {
            await fetch("http://localhost:3000/api.php", {
                method: "DELETE",
                headers: { "content-type": "application/json" },
                body: JSON.stringify({
                    url: "users/123",
                    data:{
                        name:""
                    }
                })
            });
        });
    });
    describe("Test PUT request", function() {
        before(function() {
            console.log("Should reset Database");
        });
        it("should update a specific user given correct url and data", async function() {
            let fetched = await fetch("http://localhost:3000/api.php", {
                method: "PUT",
                headers: { "content-type": "application/json" },
                body: JSON.stringify({
                    url: "users/CSC9",
                    data: {
                        name: "TROLL",
                        photo: "DAN"
                    }
                })
            });
            expect(fetched).to.have.status(202);

            let fetchedJSON = await fetched.json();
        });
    });
    describe("Test DELETE request", function() {
        before(function() {
            console.log("Should reset Database");
        });
        it("should delete a specific user given correct url", async function() {
            let fetched = await fetch("http://localhost:3000/api.php", {
                method: "DELETE",
                headers: { "content-type": "application/json" },
                body: JSON.stringify({
                    url: "users/CSC9",
                    data:{
                        name:""
                    }
                })
            });
            expect(fetched).to.have.status(202);

            let fetchedJSON = await fetched.json();
        });
    });
});
