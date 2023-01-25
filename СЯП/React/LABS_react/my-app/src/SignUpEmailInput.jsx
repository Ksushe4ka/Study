import React, {useEffect} from 'react'  
import {useState} from 'react'

const SignUpEmailInput = ({sendButtonState, setSendButtonState}) => { //функциональный компонент
	const [state, setState] = useState('')  //переменная состояния с начальным значением
	const [pClass, setPClass] = useState('×') 

	useEffect(() => {
		if(state === '✓')
			setSendButtonState({...sendButtonState, email: true})
		else
			setSendButtonState({...sendButtonState, email: false})
	}, [state]) 

	const onEmailInput = (e) => {
		let input = e.target  //то что вызывает событие
	
		if (input.value.match(/\S@\S+\.\S+/i)) { setState('✓'); setPClass('✓') }
		else { setState('введите  корректный адрес почты'); setPClass('×') }

		if(input.value === '') setState('')
	}

	return (
		<div>
			<input
				type='text'
				placeholder='Email'
				onInput={onEmailInput}
			/>
			<p className={pClass}>{state}</p>
		</div>
	)
}

export default SignUpEmailInput