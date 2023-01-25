import React, { useEffect } from 'react'
import { useState } from 'react'

function SignUpPasswordInput ({sendButtonState, setSendButtonState}) {
	const [match, setMatch] = useState({ style: '', value: '' })
	const [passValues, setPassValues] = useState({ first: '', second: '' })
	const [security, setSecurity] = useState({ text: '', value: 1 })

	const onPass1Input = (e) => {
		setPassValues({ first: e.target.value, second: passValues.second })
	}

	const onPass2Input = (e) => {
		setPassValues({ first: passValues.first, second: e.target.value })
	}

	useEffect(() => {
		if(match.value === '✓')
			setSendButtonState({...sendButtonState, pass: true})
		else
			setSendButtonState({...sendButtonState, pass: false})
	}, [match])

	useEffect(() => {
		if(passValues.first === '') setMatch({ style: '', value: '' })
		else
		if (passValues.first === passValues.second) setMatch({ style: '✓', value: '✓' })
		else setMatch({ style: 'пароль не совпадает', value: 'пароль не совпадает' })

		let protectionLevel = 0, text = ''

		if(passValues.first.match(/\d/)) protectionLevel++
		if(passValues.first.match(/[a-z]/)) protectionLevel++
		if(passValues.first.match(/[A-Z]/)) protectionLevel++
		if(passValues.first.match(/[@!~#$%^&*()\-_=+':";?<>/\\]/)) protectionLevel++

		switch(protectionLevel) {
			case 1: text = 'сложность пароля низкая'
				break
			case 2: text = 'сложность пароля средняя'
				break
			case 3: text = 'сложность пароля высокая'
				break
			case 4: text = 'сложность пароля очень высокая'
				break
			default:
		}

		setSecurity({ text: text, value: protectionLevel })
	}, [passValues])

	return (
		<div>
			<input
				type='Password'
				placeholder='пароль'
				onChange={onPass1Input}
			/>
			<input
				type='Password'
				placeholder='подтверждение пароля'
				onChange={onPass2Input}
			/>
			<p>{match.value}</p>
			<p>{security.text}</p>
			<progress max='4' value={security.value}></progress>
		</div>
	)
}

export default SignUpPasswordInput