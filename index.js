import Fastify from "fastify";
import os from "os";
const fastify = Fastify({
  logger: true,
});

fastify.get("/", async (_request, _reply) => {
  return { hello: "world", host: os.hostname() };
});

/**
 * Run the server!
 */
const start = async () => {
  try {
    await fastify.listen({ port: 3000, host: "0.0.0.0" });
  } catch (err) {
    fastify.log.error(err);
    process.exit(1);
  }
};
start();
