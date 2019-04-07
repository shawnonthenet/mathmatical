// We need to import the CSS so that webpack will load it.
// The MiniCssExtractPlugin is used to separate it out into
// its own CSS file.
import 'katex/dist/katex.min.css';
import css from "../css/app.css"

// webpack automatically bundles all modules in your
// entry points. Those entry points can be configured
// in "webpack.config.js".
//
// Import dependencies
//
import "phoenix_html"
import React from "react"
import ReactDOM from "react-dom"
import WorkBook from "./components/WorkBook"
import AnswerDisplay from "./components/AnswerDisplay"
// Import local files
//
// Local files can be imported directly using relative paths, for example:
import socket from "./socket"

if(document.getElementById('math')) {
  let channel = socket.channel("questions", {})
  channel.join()
    .receive("ok", resp => { channel.push("get_next_question", {id: 0}) })
    .receive("error", resp => { console.log("Unable to join", resp) })

  channel.on("new_question", question => {
    ReactDOM.render(
      <WorkBook channel={channel} question={question}></WorkBook>,
      document.getElementById('math')
    );
  })

  channel.on("answer_result", result => {
    ReactDOM.render(
      <AnswerDisplay question={result.question} question_id={result.question.id} answer={result.answer} result={result.result} channel={channel}/>,
      document.getElementById('math')
    );
  })

  channel.on("finished", result => {
    ReactDOM.render(
      <AnswerDisplay question_id={0} finished={true} channel={channel}/>,
      document.getElementById('math')
    );
  });
}
