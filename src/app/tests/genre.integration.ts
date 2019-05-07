import * as chai from "chai";
import chaiHttp = require("chai-http");
import "mocha";

const server =  process.env.integration_server_url;

chai.use(chaiHttp);

describe("Testing Genre Controller Methods", () => {

  it("Testing /api/genres", async () => {
    return chai.request(server)
    .get(`/api/genres`)
    .then((res) => {
      chai.expect(res).to.have.status(200);
      const body = res.body;
      chai.assert.isArray(body);
      chai.assert.isAtLeast(body.length, 0);
    });
  });

});
