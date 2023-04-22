import consumer from "channels/consumer"

const groupLinks = document.querySelectorAll(".group-link");
groupLinks.forEach((link) => {
  link.addEventListener("click", (event) => {
    const groupId = link.dataset.groupId;

    consumer.subscriptions.create({ channel: "GroupChannel", group_id: groupId }, {
      connected() {
        console.log(`Connected to GroupChannel ${groupId}`);
      },
      disconnected() {
        console.log(`Disconnected from GroupChannel ${groupId}`);
      },
      received(data) {
        console.log(`Received data from GroupChannel ${groupId}: `, data);
      },
    });
  });
});
  