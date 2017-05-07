import React from "react";

class Calculator extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      result: 0,
      num1: "",
      num2: ""
    };
    this.setNum1 = this.setNum1.bind(this);
    this.setNum2 = this.setNum2.bind(this);
    this.add = this.add.bind(this);
    this.subtract = this.subtract.bind(this);
    this.multiply = this.multiply.bind(this);
    this.divide = this.divide.bind(this);
    this.clear = this.clear.bind(this);
  }

  setNum1(e){
    let enum1 = e.target.value ? parseInt(e.target.value) : "";
    this.setState({num1: enum1});
  }

  setNum2(e){
    let enum2 = e.target.value ? parseInt(e.target.value) : "";
    this.setState({num2: enum2});
  }

  add(e){
    e.preventDefault();
    let sum = this.state.num1 + this.state.num2;
    this.setState({result: sum});
  }
  subtract(e){
    e.preventDefault();
    let diff = this.state.num1 - this.state.num2;
    this.setState({result: diff});
  }

  multiply(e){
    e.preventDefault();
    let prod = this.state.num1 * this.state.num2;
    this.setState({result: prod});
  }

  divide(e){
    e.preventDefault();
    let quot = this.state.num1 / this.state.num2;
    this.setState({result: quot});
  }

  clear(e){
    e.preventDefault();
    this.setState({ num1: "", num2: "", result: 0 });
  }

  render(){
    return (
      <div>
        <label>
          num1
          <input type="text" onChange={this.setNum1} value={this.state.num1}></input>
        </label>

        <label>
          num2
          <input type="text" onChange={this.setNum2} value={this.state.num2}></input>
        </label>
        <br />
        <button type="sumbit" value="add" onClick={this.add}>+</button>
        <button type="sumbit" value="subtract" onClick={this.subtract}>-</button>
        <button type="sumbit" value="multiply" onClick={this.multiply}>*</button>
        <button type="sumbit" value="divide" onClick={this.divide}>/</button>
        <button type="sumbit" value="divide" onClick={this.clear}>Clear</button>

        <h1>{this.state.result}</h1>
      </div>
    );
  }
}

export default Calculator;
