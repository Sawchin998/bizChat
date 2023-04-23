import consumer from "channels/consumer"

let currentSubscription;
const groupLinks = document.querySelectorAll(".group-link");
groupLinks.forEach((link) => {
  link.addEventListener("click", (event) => {
    const groupId = link.dataset.groupId;

    if (currentSubscription && currentSubscription.identifier === JSON.stringify({ channel: "GroupChannel", group_id: groupId })) {
      console.log(`Already subscribed to GroupChannel ${groupId}`);
      return;
    }

    if (currentSubscription) {
      currentSubscription.unsubscribe();
    }

    currentSubscription = consumer.subscriptions.create({ channel: "GroupChannel", group_id: groupId }, {
      connected() {
        console.log(`Connected to GroupChannel ${groupId}`);
      },
      disconnected() {
        console.log(`Disconnected from GroupChannel ${groupId}`);
      },
      received(data) {
        const container = document.getElementById("new-msg")
        container.insertAdjacentHTML("beforeend", data)
      },
    
    });
  });
});
  