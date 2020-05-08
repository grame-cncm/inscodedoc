Overview
===============================================

INScore scene can embed objects to provide web capabilities in order to make this score available to remote clients.

Two types of objects are available : 

• an HTTP server, which INScore type is 'httpd' and that takes a listening port number as argument,
• a WebSocket server, which type is 'websocket' and that takes a listening port number and a maximum rate for clients notification as arguments.

This objects can :doc:`get` (like score version and screen image) or :doc:`post` to update the score.

This is a RESTful web service with HTTP server. Each service is identified by a path and a http method. The GET HTTP method is used to retrieve data and the POST method is used to send data. 

As websockets don't use path, a JSON object construct the request and is send to the server. The `method` field identify the service (like http path). Websocket responses are asychronous, a request id must be provided in the request. He is added in the response of the server.

`Comparison of the request to get score image between http and websocket:`

======================  ===============================================
 HTTP		          websocket
======================  ===============================================
serverURL/``image``	  { id="1", method="``image``" }
======================  ===============================================

**Websocket specificities:**

With it's bidirectional communication, the websocket server sends notifications with the screen version number when the score changes. Note that websocket responses are asynchronous, that's why an 'id' is introduced in JSON objects, that is send back with the response.

Websocket doesn't have a response code like http but a status field is always present in response object with one of these two values :
	* ``OK`` in case of success
	* ``ERROR`` in case of error.

If an non-existing method or more generally, an incorrect json object is send to the server, the response is a generic json object error with the resquest id when available, or an empty id if it cannot be read.

Example: ``{ id: "45612", status: "ERROR", "error" : "Bad request" }``




