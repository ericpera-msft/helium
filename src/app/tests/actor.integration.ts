import * as chai from "chai";
import chaiHttp = require("chai-http");
import "mocha";
<<<<<<< HEAD
import { integrationServer } from "../../config/constants";
=======
import { NumberUtilities } from "../../utilities/numberUtilities";

const server = process.env.integration_server_url;
const numUtility = new NumberUtilities();
>>>>>>> upstream/master

chai.use(chaiHttp);

describe("Testing Actor Controller Methods", () => {

<<<<<<< HEAD
  it("Testing /api/actors", async () => {
    const queryId = "nm0000323";
    return chai.request(integrationServer)
    .get(`/api/actors`)
    .then((res) => {
      chai.expect(res).to.have.status(200);
      const id = res.body[0].actorId;
      chai.assert.equal(queryId, id);
    });
  });

  it("Testing /api/actors/:id", async () => {
    const queryId = "nm0000323";
    return chai.request(integrationServer)
    .get(`/api/actors/${queryId}`)
    .then((res) => {
      chai.expect(res).to.have.status(200);
      const id = res.body[0].actorId;
      chai.assert.equal(queryId, id);
    });
=======
  it("Testing GET /api/actors", async () => {
    return chai.request(server)
      .get(`/api/actors`)
      .then((res) => {
        chai.expect(res).to.have.status(200);
        const body = res.body;
        chai.assert.isArray(body);
      });
  });

  it("Testing POST + GET /api/actors/:id", async () => {
    const randomNumber = numUtility.getRandomNumber();
    const actor = {
      actorId: "${randomNumber}",
      type: "Actor",
// tslint:disable-next-line: object-literal-sort-keys
      name: "someName",
      birthYear: 1997,
      profession: ["actor"],
    };

    chai.request(server)
      .post("/api/actors")
      .set("content-type", "application/json")
      .send(actor)
      .then((res) => {
        chai.expect(res).to.have.status(201);
        return chai.request(server)
          .get(`/api/actors/${randomNumber}`)
          .then((getResponse) => {
            chai.expect(getResponse).to.have.status(200);
            const body = getResponse.body;
            chai.assert.isArray(body);
            chai.assert.isAtLeast(body.length, 1);
            const id = body[0].actorId;
            chai.assert.equal(randomNumber, id);
          });
      });
>>>>>>> upstream/master
  });

});
