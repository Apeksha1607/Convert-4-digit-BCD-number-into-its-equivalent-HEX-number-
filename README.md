# 🔢 BCD to HEX Conversion using X86/64 Assembly

This project implements an **X86/64 Assembly Language Program (ALP)** that converts a **4-digit BCD (Binary Coded Decimal) number** entered by the user into its **equivalent hexadecimal (HEX) number**.

The program is written for **Linux using NASM assembler** and demonstrates number conversion using **ASCII to decimal and decimal to hexadecimal algorithms**.

---

## 📌 Program Description

The program performs the following steps:

1. Displays a message asking the user to enter a **4-digit BCD number**.
2. Reads the input from the keyboard.
3. Converts the **ASCII digits to a decimal number**.
4. Converts the decimal number to **hexadecimal using repeated division by 16**.
5. Displays the **equivalent HEX value** on the screen.

---

## 🛠 Technologies Used

* **X86/64 Assembly Language**
* **NASM (Netwide Assembler)**
* **Linux System Calls**

---

## 📂 Project Structure

```text
bcd-to-hex-conversion/
│
├── bcd_to_hex.asm
└── README.md
```

---

## ⚙️ How the Program Works

### 1️⃣ Input

The user enters a **4-digit BCD number**.

Example:

```
Enter 4 digit BCD number: 1234
```

### 2️⃣ ASCII to Decimal Conversion

Each ASCII digit is converted into its numeric value using:

```
digit = ASCII - '0'
```

The decimal number is built using:

```
result = result * 10 + digit
```

---

### 3️⃣ Decimal to Hexadecimal Conversion

The decimal value is converted into HEX using **repeated division by 16**.

```
remainder = number % 16
number = number / 16
```

Each remainder is converted into a HEX digit.

---

## ▶️ How to Compile and Run

### Step 1: Assemble the program

```bash
nasm -f elf64 bcd_to_hex.asm
```

### Step 2: Link the object file

```bash
ld -o bcd_to_hex bcd_to_hex.o
```

### Step 3: Run the program

```bash
./bcd_to_hex
```

---

## 💻 Example Output

```
Enter 4 digit BCD number: 1234

Equivalent HEX number: 04D2
```

---

## 🎯 Learning Objectives

This project helps understand:

* Basics of **Assembly Language Programming**
* **Linux system calls**
* **ASCII to numeric conversion**
* **Decimal to hexadecimal conversion**
* Register usage in **x86-64 architecture**

---

## 📄 License

This project is created for **educational purposes** and can be freely used for learning.

---

⭐ If you found this project useful, consider giving the repository a **star on GitHub**.
