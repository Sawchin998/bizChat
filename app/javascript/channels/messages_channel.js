import consumer from "channels/consumer"

consumer.subscriptions.create("MessagesChannel", {
  connected() {
    console.log("connected to message channel")
  },

  disconnected() {
    console.log("disconnected from message channel")
  },

  received(data) {
    const container = document.getElementById("latest-msg")
    container.insertAdjacentHTML("beforeend", data)
  }
});




