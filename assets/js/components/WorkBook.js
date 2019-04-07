import React, { Component, Fragment } from "react";
import MathInput from "./MathInput"
import AsciiMathParser from "../asciimath2tex.js"
import TeX from '@matejmazur/react-katex';

export default class WorkBook extends Component {

  constructor(props) {
    super(props)

    this.state = { rows: [true] }

    this.onClick = this.onClick.bind(this)

    this.parser = new AsciiMathParser()
  }

  onClick(event) {
    var newRows = this.state.rows.map(row => false)
    newRows.push(true)
    this.setState({rows: newRows})
  }
  render() {
    return (
      <div className="container">
        <h4 className="font-hairline my-5"><TeX>{this.parser.parse(this.props.question.question)}</TeX></h4>
        {this.state.rows.map((row, i) =>
          <MathInput showButton={row} key={i} question={this.props.question} channel={this.props.channel}></MathInput>
        )}
        <div className="flex justify-between mt-5">
          <button onClick={this.onClick} className="bg-blue hover:bg-blue-dark text-white font-bold py-2 px-4 rounded">Add Row</button>
        </div>
      </div>
    )
  }
}
