import React, {useState} from 'react'
import PhoneInput from './PhoneInput'
import SignUpEmailInput from './SignUpEmailInput'
import SignUpPasswordInput from './SignUpPasswordInput'



function SignUpForm () {
    const [sendButtonState, setSendButtonState] = useState({email: false, pass: false})


    const days = [], years = []
    for (let i = 1; i < 32; i++) days.push(i)
    for (let i = 2022; i > 1950; i--) years.push(i)

    const months = [
        'Январь', 'Февраль', 'Март', 'Апрель', 'Май', 'Июнь', 'Июль',
        'Август', 'Сеньтябрь', 'Октябрь', 'Ноябрь', 'Декабрь'
    ]

    const allDays = days.map((day) => {
        return <option key={day}>{day}</option>
    })

    const allYears = years.map((year) => {
        return <option key={year}>{year}</option>
    })

    const allMonths = months.map((month, index) => {
        return <option key={index}>{month}</option>
    })

    return (
        <form>
            <p>Задание 1</p>
            <SignUpEmailInput sendButtonState={sendButtonState} setSendButtonState={setSendButtonState}/>
            <SignUpPasswordInput sendButtonState={sendButtonState} setSendButtonState={setSendButtonState}/>
            <input placeholder={'Имя'}/><br/>
            <input placeholder={'Фамилия'}/><br/>
            <input placeholder={'Отчество'}/><br/>
            <input type={'radio'} name={'pol'}/>Мужской
            <input type={'radio'} name={'pol'}/>Женский<br/>
            <select>{allDays}</select>
            <select>{allMonths}</select>
            <select>{allYears}</select>
            <PhoneInput/>
            <input type="submit" value="отправить" disabled={!sendButtonState.email || !sendButtonState.pass}/> 
        </form>
    )
} // пока нет пороля и емейла то мы не можем нажать на кнопку

export default SignUpForm