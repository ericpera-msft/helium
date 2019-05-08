import * as chai from "chai";
import chaiHttp = require("chai-http");
import "mocha";
import { integrationServer } from "../../config/constants";

chai.use(chaiHttp);

describe("Testing Actor Controller Methods", () => {

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
  });

});
