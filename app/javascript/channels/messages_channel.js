import consumer from "channels/consumer"

  consumer.subscriptions.create("MessagesChannel", {
    connected() {
      console.log("connected to message channel")
    },
  
    disconnected() {
      console.log("disconnected from message channel")
    },
  
    received(data) {
      console.log("messagechannel  ", data)
    }
  });




