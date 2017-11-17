import {
  Socket
} from "phoenix"

let socket = new Socket("/socket", {
  params: {
    token: window.userToken
  }
})

socket.connect()

// Now that you are connected, you can join channels with a topic:
let channel = socket.channel("info:sys", {})
channel.join()
  .receive("ok", resp => {
    console.log("Joined successfully", resp)
  })
  .receive("error", resp => {
    console.log("Unable to join", resp)
  })

let out = document.getElementById("out")

const print = (msg) => {
  out.innerHTML += "<br /> " + msg
}

channel.on("pong", (x) => {
  print("pong")
})

let pingBtn = document.getElementById("ping")

if (pingBtn) {
  pingBtn.addEventListener("click", function() {
    print("ping")
    channel.push("ping", {
      name: "Dan"
    })
  })
}

if (document.getElementById("stats-page")) {
  channel.on("stats", stats => {
    document.getElementById("out")
      .innerHTML = `Processes: ${stats.proc_count}`
  })
}

export default socket

