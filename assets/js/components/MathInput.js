import React, { Component, Fragment } from "react";
import AsciiMathParser from "../asciimath2tex.js"
import TeX from '@matejmazur/react-katex';

export default class MathInput extends Component {

  constructor(props) {
    super(props)
    this.state = { channel: props.channel, showButton: props.showButton, inputText: "", outputTex: " " }

    this.onChange = this.onChange.bind(this)
    this.submit = this.submit.bind(this)
  }

  componentDidUpdate(prevProps) {
    if (this.props.showButton !== prevProps.showButton) {
      this.setState({showButton: this.props.showButton});
    }
  }

  onChange(event) {
    const parser = new AsciiMathParser();
    const tex = parser.parse(event.target.value);
    this.setState({inputText: event.target.value, outputTex: tex})
  }

  submit(event) {
    this.state.channel.push("submit_answer", {id: this.props.question.id, answer: this.state.inputText});
  }
  render() {

    var button = (
      <div className="flex -mr-px">
        <button onClick={this.submit} className="bg-blue hover:bg-blue-dark text-white font-bold flex items-center leading-normal rounded rounded-l-none px-3 whitespace-no-wrap text-sm">Submit Answer</button>
      </div>
    )

    if(this.state.showButton == false) {
      button = ""
    }
    return (
      <div className="flex flex-row">
        <div className="w-1/2 my-1">
          <div className="flex flex-wrap items-stretch w-full relative">
            <input type="text" onChange={this.onChange} value={this.state.inputText} className="flex-shrink flex-grow flex-auto leading-normal w-px flex-1 border h-10 border-grey-light rounded rounded-r-none px-3 relative"/>
            {button}
          </div>
        </div>
        <div className="w-1/2 px-3">
          <TeX>{this.state.outputTex}</TeX>
        </div>
      </div>
    )
  }
}
