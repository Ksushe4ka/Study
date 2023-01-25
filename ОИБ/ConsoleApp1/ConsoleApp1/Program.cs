using System;
using System.IO;
using System.Linq;
using System.Security.Cryptography;
using System.Text;


class rsa
{
    //Вариант 12, Ксения Корело
    //Алгоритм шифрования(размер ключа)  RSA (640bit)
    //Алгоритм хеширования SHA384

    static void Main()
    {
        //string message = "Ксения Корело Александровна";
        string message = "Kseniya Korelo Alexandrovna";

        using (RSA myRsa = RSA.Create(640))
        {
            var publickey = myRsa.ToXmlString(false);   //получим открытый ключ
            string privatekey = myRsa.ToXmlString(true);//получим закрытый ключ
            UnicodeEncoding byteConverter = new UnicodeEncoding();
            byte[] encrypted = myRsa.Encrypt(byteConverter.GetBytes(message), RSAEncryptionPadding.Pkcs1);
            StringBuilder builder = new StringBuilder();
            foreach (byte b in encrypted)
                builder.Append(b.ToString("x2").ToLower());

            byte[] decrypted = myRsa.Decrypt(encrypted, RSAEncryptionPadding.Pkcs1);


            Console.WriteLine("До шифрования:    {0}", message);
            Console.WriteLine();
            Console.WriteLine("Открытый ключ в формате xml:    {0}", publickey);
            Console.WriteLine();
            Console.WriteLine("Закрытый ключ в формате xml:    {0}", privatekey);
            Console.WriteLine();
            Console.WriteLine("Зашифрованное:    {0}", builder);
            Console.WriteLine();
            Console.WriteLine("После дешифровки: {0}", Encoding.UTF8.GetString(decrypted));
            Console.WriteLine();
            Console.WriteLine("Хэширование: {0}", Hash(message));


            //Запись в файл
            using (StreamWriter writer = new StreamWriter("crp.txt", true))
            {
                writer.WriteLine("PubKey:");
                writer.WriteLine(publickey);
                writer.WriteLine("PrivKey:");
                writer.WriteLine(privatekey);
                writer.WriteLine("EncryptMessage:");
                writer.WriteLine(builder);
                writer.WriteLine("Hash:");
                writer.WriteLine(Hash(message));

            }
        }
    }
    //Хэширование
    static string Hash(string input)
    {
        using (SHA384 sha384 = new SHA384Managed())
        {
            var hash = sha384.ComputeHash(Encoding.UTF8.GetBytes(input));
            var sb = new StringBuilder(hash.Length * 2);

            foreach (byte b in hash)
            {
                // can be "x2" if you want lowercase
                sb.Append(b.ToString("X2"));
            }

            return sb.ToString();
        }
    }

}