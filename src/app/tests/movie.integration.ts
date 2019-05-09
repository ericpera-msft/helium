import * as chai from "chai";
import chaiHttp = require("chai-http");
import "mocha";
<<<<<<< HEAD
import { integrationServer } from "../../config/constants";
=======
import { StringUtilities } from "../../utilities/stringUtilities";

const server = process.env.integration_server_url;
const stringUtil = new StringUtilities();
>>>>>>> upstream/master

chai.use(chaiHttp);

describe("Testing Movie Controller Methods", () => {

<<<<<<< HEAD
  it("Testing /api/movies", async () => {
    const movieId = "tt0347779";
    return chai.request(integrationServer)
=======
  it("Testing GET /api/movies", async () => {
    return chai.request(server)
>>>>>>> upstream/master
    .get(`/api/movies`)
    .then((res) => {
      chai.expect(res).to.have.status(200);
      const body = res.body;
      chai.assert.isArray(body);
    });
  });

<<<<<<< HEAD
  it("Testing /api/movies/:id", async () => {
    const queryId = "tt0120737";
    return chai.request(integrationServer)
    .get(`/api/movies/${queryId}`)
=======
  const randomString = stringUtil.getRandomString();

  const testMovie = {
    genres: [],
    id: randomString,
    movieId: randomString,
    roles: [],
    runtime: 120,
    title: randomString,
    type: "Movie",
    year: 1994,
  };

  it("Testing POST + GET /api/movies/:id", async () => {
    return chai.request(server)
    .post("/api/movies")
    .set("content-type", "application/json")
    .send(testMovie)
>>>>>>> upstream/master
    .then((res) => {

      chai.expect(res).to.have.status(201);
      return chai.request(server)
        .get(`/api/movies/${randomString}`)
        .then((getResponse) => {
          chai.expect(getResponse).to.have.status(200);
          const getRespBody = getResponse.body;
          chai.assert.isArray(getRespBody);
          chai.assert.isAtLeast(getRespBody.length, 1);
          chai.assert.equal(randomString, getRespBody[0].movieId);
          chai.assert.equal(randomString, getRespBody[0].title);
        });
    });
  });
});
