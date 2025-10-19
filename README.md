
#  Vending Machine Controller (Verilog HDL)

A **Finite State Machine (FSM)**-based vending machine designed in **Verilog HDL** to simulate automated product dispensing based on coin input and product selection.

---

##  About

This project implements a **Vending Machine Controller** using **Verilog HDL**, capable of accepting coins, handling multiple product selections, and dispensing items automatically.  
The system uses **Finite State Machine (FSM)** logic to manage transitions between states like *Idle*, *Coin Input*, *Selection*, *Dispense*, and *Reset*, ensuring smooth and reliable operation.

---

##  Features

- 💰 **Coin Detection** — Accepts predefined coin values (e.g., ₹5, ₹10)  
- 🧩 **Product Selection** — Supports multiple product codes  
- 🔄 **FSM Control** — Handles transitions between states efficiently  
- ⚙️ **Change Return** — Returns balance if inserted amount exceeds product cost  
- 🧾 **Display Simulation** — Shows product dispense or insufficient balance status  
- 🧰 **Testbench Support** — Fully simulated and verified using *ModelSim / Vivado*

---

##  State Machine Design

```text
     ┌────────┐
     │  IDLE  │
     └───┬────┘
         │ Insert Coin
         ▼
   ┌────────────┐
   │ COIN INPUT │
   └────┬───────┘
        │ Select Product
        ▼
   ┌──────────────┐
   │  SELECTION   │
   └────┬─────────┘
        │ Enough Money?
   ┌────▼────┐      ┌────────────┐
   │ DISPENSE │◄────┤ INSUFFICIENT│
   └────┬────┘      └────────────┘
        │
        ▼
     ┌───────┐
     │ RESET │
     └───────┘
