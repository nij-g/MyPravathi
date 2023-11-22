<%-- 
    Document   : donate
    Created on : 4 Dec, 2019, 12:30:53 AM
    Author     : hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1"> <!-- Ensures optimal rendering on mobile devices. -->
        <meta http-equiv="X-UA-Compatible" content="IE=edge" /> <!-- Optimal Internet Explorer compatibility -->
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Welcome user</h1>
        <script
            src="https://www.paypal.com/sdk/js?client-id=AVsDtsb0zWdm4W0KGP1npDXyFbwi31q1BsL0QtF59vLH1oxwxbtK6hJJ2xIoIVV4z2NN1Xng_Ec7LJH8"> // Required. Replace SB_CLIENT_ID with your sandbox client ID.
        </script>
        <div id="paypal-button-container"></div>

  
  <script>
  paypal.Buttons({
      style: {
                color:  'blue',
                shape:  'pill',
                label:  'pay',
                height: 40
            },
    createOrder: function(data, actions) {
      return actions.order.create({
        purchase_units: [{
          amount: {
            value: '0.01'
          }
        }]
      });
    },
    onApprove: function(data, actions) {
      return actions.order.capture().then(function(details) {
        alert('Transaction completed by ' + details.payer.name.given_name);
        // Call your server to save the transaction
        return fetch('/paypal-transaction-complete', {
          method: 'post',
          headers: {
            'content-type': 'application/json'
          },
          body: JSON.stringify({
            orderID: data.orderID
          })
        });
      });
    }
  }).render('#paypal-button-container');

</script>
    </body>
</html>

