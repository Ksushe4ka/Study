 const array = new Uint8Array(1);
 console.log(crypto.getRandomValues(array));


 const text = 'Kseniya Korelo Alexandrovna';
  

     async function digestMessage(message) {
     const encoder = new TextEncoder();
     const data = encoder.encode(message);
    const hash = await crypto.subtle.digest('SHA-512', data);
    return hash;
   }

const generateKey = async () => {  //Генерация случайного CryptoKey 
	const params = {  		//объект params, указывающий целевой алгоритм
		name: 'AES-GCM',
		length: 256
	};
	////массив строк — keyUsages, указывающий, с какими алгоритмами можно использовать ключ
	const keyUsages = ['encrypt', 'decrypt']; 	//encrypt: Ключ используется для шифрования сообщений. decrypt: Ключ используется для расшифровки сообщений.
	
	const key = await crypto.subtle.generateKey(params, true, keyUsages);
	return key;
};

const encryptAESGCM = async (message, key) => {
	const originalPlaintext = (new TextEncoder()).encode(message);
	const encryptDecryptParams = {
		name: 'AES-GCM',
		iv: crypto.getRandomValues(new Uint8Array(16))
	};
	const ciphertext = await crypto.subtle.encrypt(encryptDecryptParams, key, originalPlaintext); //шифровка
	return { ciphertext, encryptDecryptParams };
};

const wrapKey = async key => {  
	const wrappingKeyUsages = ['wrapKey', 'unwrapKey'];
	const wrappingKeyParams = {
		name: 'AES-KW',
		length: 256
	};
	const keyAlgoIdentifier = 'AES-GCM';
	const keyUsages = ['encrypt', 'decrypt'];
	const keyParams = {
 		name: 'AES-GCM',
		length: 256
	};
	const wrappingKey = await crypto.subtle.generateKey(wrappingKeyParams, true, wrappingKeyUsages);
	const wrappedKey = await crypto.subtle.wrapKey('raw', key, wrappingKey, 'AES-KW'); 
	return { wrappingKey, wrappedKey, wrappingKeyParams, keyParams, keyUsages };
	
};

const encryptDecryptAndWrapKey = async message => {
	const key = await generateKey();
	const encryptedValue = await encryptAESGCM(message, key);
	const decryptedValue = await crypto.subtle.decrypt(encryptedValue.encryptDecryptParams, key, encryptedValue.ciphertext); //расшифровка
	console.log('Key:');
	console.table(key);
	console.log('Encrypted message:');
	console.table(encryptedValue);
	console.log(`Decrypted message: ${(new TextDecoder()).decode(decryptedValue)}`);

	const wrappedKey = await wrapKey(key);
	const unwrappedKey = await crypto.subtle.unwrapKey('raw', wrappedKey.wrappedKey,
	wrappedKey.wrappingKey, wrappedKey.wrappingKeyParams, wrappedKey.keyParams, true, wrappedKey.keyUsages);
	console.log('Wrapped key:');
	console.table(wrappedKey);
	console.log('Unrapped key:');
	console.table(unwrappedKey);
	console.log(`Unwrapped key matches original key: ${JSON.stringify(unwrappedKey) === JSON.stringify(key)}`);
};

encryptDecryptAndWrapKey(text);