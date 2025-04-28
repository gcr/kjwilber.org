export default async (request) =>
  console.log("REQUEST", request);
  new Response('Hello, World!', {
    headers: { 'content-type': 'text/html' },
  })
