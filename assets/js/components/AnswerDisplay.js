import React, { Component, Fragment } from "react";
import AsciiMathParser from "../asciimath2tex.js"
import TeX from '@matejmazur/react-katex';

export default class AnswerDisplay extends Component {

  constructor(props) {
    super(props)

    this.onClick = this.onClick.bind(this)
  }

  onClick(event) {
    this.props.channel.push("get_next_question", {id: this.props.question_id})
  }
  render() {
    if(this.props.finished == true) {
      return (
        <div className="container">
          <h1 className="font-hairline my-5">Finished</h1>
          <div className="flex justify-between mt-5">
            <button onClick={this.onClick} className="bg-blue hover:bg-blue-dark text-white font-bold py-2 px-4 rounded">Restart?</button>
          </div>
        </div>
      )
    } else {
      const parser = new AsciiMathParser()
      const question = parser.parse(this.props.question.question)
      const answer = parser.parse(this.props.question.answer)
      const your_answer = parser.parse(this.props.answer)
      const result = (this.props.result == true ? (<h3 className="font-hairline">Correct</h3>) : (<h3 className="font-hairline">Incorrect</h3>))
      return (
        <div className="container">
          <h4 className="font-hairline my-5">{this.props.question.question}</h4>
          {result}
          <p>Question: <TeX>{question}</TeX></p>
          <p>Answer: <TeX>{answer}</TeX></p>
          <hr/>
          Your Answer: <TeX>{your_answer}</TeX>
          <div className="flex justify-between mt-5">
            <button onClick={this.onClick} className="bg-blue hover:bg-blue-dark text-white font-bold py-2 px-4 rounded">Next Question</button>
          </div>
        </div>
      )
    }
  }
}
