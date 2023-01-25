import React from 'react';

class PhoneInput extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            number: "",
            showList: false,
            showList1: false,
            value: "Россия",
            mask: "XX (XXX) XXX-XX-XX",
            count: 12,
        };
    }
    inputs = [//ассоциативный массив
        {
            value: "Беларусь",
            code: "+375",
            mask: "XXXX (XX) XXX-XX-XX",
            count: 13,
            op: ", МТС A1 life:)",

        }, 
        {
            value: "Россия",
            code: "+7",
            mask: "XX (XXX) XXX-XX-XX",
            count: 12,
            op: ", Билайн Мегафон МТС Tele2",
        },
        {
            value: "Украина",
            code: "+380",
            mask: "XXXX (XX) XXX-XX-XX",
            count: 13,
            op: ", Lifecell Vodafone",
        },

        {
            value: "Польша",
            code: "+48",
            mask: "XXX XXX-XXX-XXX",
            count: 12,
            op: ", Orange Play Plus T-mobile",
        },
        {
            value: "Литва",
            code: "+370",
            mask: "XXXX (XX) XXX-XX-XX",
            count: 13,
            op: ", Telia Bite Tele2",
        },
        {
            value: "Латвия",
            code: "+371",
            mask: "XXXX XXXX-XXXX",
            count: 12,
            op: ", LMT Tele2 Bite",
        },
    ];
    theList() {//лист номеров
        return (
            <ul>
                {this.inputs.map((item) => {
                    return (
                        <li
                            onChange={() =>
                                this.setState({
                                    number: item.code,
                                    showTheList: false,
                                    mask: item.mask,
                                    count: item.count,
                                    op: item.op,
                                }) 
                            }>
                            <label>
                                <input type="radio" name="country" value={item.value}/>
                                {item.value}
                                {item.code}
                                {item.op}
                            </label>
                            </li>
                    );
                })}
            </ul>
        );
    }

    handleNumberChange = (e) => { //выбор номера страны, "e" здесь это синтетическое событие
        this.setState(
            {
                number: e.target.value,
            },
            () => {
                this.inputs.forEach((item) => {//Метод forEach() выполняет указанную функцию один раз для каждого элемента в массиве.
                    if (this.state.number === item.code)
                        this.setState({
                            value: item.value,
                            mask: item.mask,
                            count: item.count,
                        });



                });

                if (this.state.count === this.state.number.length) {//определяем корректность ввода номеров (сравниваем длину введенного номера с тем который указан в коде)
                    let maskArray = this.state.mask.split(""),//разбивает строку на массив элементов 
                        numberArray = this.state.number.split("");
                    for (let i = 0, j = 0; i < maskArray.length; i++) // проходимся по элементу нашей маски
                        if (maskArray[i] === "X") {     
                            maskArray[i] = numberArray[j];
                            j++;
                        }
                    this.setState({ number: maskArray.join("") }); //объединяет элементы массива в строку
                }
            }
        );
    };
    numberField() {//поле номера
        return (
            <>
                <label>
                    <input 
                        onClick={() =>
                            this.setState({ showList: !this.state.showList })
                        }
                        id="number"
                        type="tel"
                        name="Phone"
                        placeholder="+7 (999) 000-00-00"
                        value={this.state.number}
                        onChange={this.handleNumberChange}
                        maxLength={this.state.count} 
                    />
                </label>
            </>
        );
    }
    render() {//выводим на экран  
        return (
            <div>
                <div>{this.numberField()}</div>
                {this.state.showList ? this.theList() : null}  
            </div>
        );
    }
} // если showlist = true, то вызывается thelist

export default PhoneInput