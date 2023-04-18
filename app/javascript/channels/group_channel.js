import consumer from "channels/consumer"

consumer.subscriptions.create({ channel: "GroupChannel", group_id: 1}, {
  connected() {
    console.log("connected to Group channel")
  },

  disconnected() {
    console.log("disconnected from Group channel")
  },

  received(data) {
    console.log("groupchannel  ", data)
  }
});

  