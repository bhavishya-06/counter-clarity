# Simple Counter Contract

A basic Clarity smart contract that demonstrates fundamental blockchain programming concepts using the Stacks blockchain.

## Overview

This project contains a simple counter contract written in Clarity, the smart contract language for the Stacks blockchain. The contract allows users to increment, decrement, reset, and query a counter value stored on the blockchain.

## Contract Features

The counter contract provides the following functions:

- **`get-counter`** - Read the current counter value
- **`increment`** - Add 1 to the counter
- **`decrement`** - Subtract 1 from the counter (prevents going below 0)
- **`reset`** - Set counter back to 0
- **`set-counter`** - Set counter to any specific value

## Prerequisites

Before running this project, make sure you have the following installed:

- [Clarinet](https://docs.hiro.so/clarinet/) - The development environment for Clarity
- [Node.js](https://nodejs.org/) (for running tests)

## Installation

1. Clone this repository:
```bash
git clone <repository-url>
cd clar_ptoj4
```

2. Install dependencies (for testing):
```bash
npm install
```

## Usage

### Check Contract Syntax

Validate the contract syntax:
```bash
clarinet check
```

### Start Clarinet Console

Interact with the contract in real-time:
```bash
clarinet console
```

In the console, you can:
```clarity
;; Deploy the contract
(contract-call? .counter deploy)

;; Get current counter value
(contract-call? .counter get-counter)

;; Increment the counter
(contract-call? .counter increment)

;; Decrement the counter
(contract-call? .counter decrement)

;; Reset the counter
(contract-call? .counter reset)

;; Set counter to a specific value
(contract-call? .counter set-counter u10)
```

### Run Tests

Execute the test suite:
```bash
npm test
```

### Deploy to Local Network

Start a local development network:
```bash
clarinet start
```

Deploy the contract:
```bash
clarinet deploy
```

## Contract Code

The main contract is located in `contracts/counter.clar`:

```clarity
(define-data-var counter uint u0)

(define-public (get-counter)
  (ok (var-get counter))
)

(define-public (increment)
  (let ((current (var-get counter)))
    (var-set counter (+ current u1))
    (ok (var-get counter))
  )
)

(define-public (decrement)
  (let ((current (var-get counter)))
    (if (<= current u0)
      (err u1)
      (begin
        (var-set counter (- current u1))
        (ok (var-get counter))
      )
    )
  )
)

(define-public (reset)
  (begin
    (var-set counter u0)
    (ok (var-get counter))
  )
)

(define-public (set-counter (value uint))
  (begin
    (var-set counter value)
    (ok (var-get counter))
  )
)
```

## Key Clarity Concepts Demonstrated

- **Data Variables**: Persistent state storage using `define-data-var`
- **Public Functions**: Functions that can be called from outside the contract
- **Error Handling**: Returning `(err code)` for error conditions
- **Type Safety**: Using `uint` (unsigned integer) types
- **Control Flow**: `if` statements and `begin` blocks for multiple expressions
- **Return Values**: Functions return `(ok value)` for success

## Project Structure

```
clar_ptoj4/
├── contracts/
│   └── counter.clar          # Main counter contract
├── tests/                    # Test files
├── settings/
│   └── Devnet.toml          # Development network settings
├── Clarinet.toml            # Project configuration
├── package.json             # Node.js dependencies
└── README.md               # This file
```

## Development

### Adding New Functions

To add new functionality to the counter contract:

1. Edit `contracts/counter.clar`
2. Add your function using `define-public`
3. Run `clarinet check` to validate syntax
4. Test your changes in the console

### Writing Tests

Create test files in the `tests/` directory using the Clarinet testing framework. Tests can be written in TypeScript or Clarity.

## Resources

- [Clarity Language Reference](https://docs.stacks.co/write-smart-contracts/overview)
- [Clarinet Documentation](https://docs.hiro.so/clarinet/)
- [Stacks Documentation](https://docs.stacks.co/)

## License

This project is open source and available under the [MIT License](LICENSE).

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests for new functionality
5. Submit a pull request

## Support

If you encounter any issues or have questions:

1. Check the [Clarinet documentation](https://docs.hiro.so/clarinet/)
2. Review the [Clarity language reference](https://docs.stacks.co/write-smart-contracts/overview)
3. Open an issue in this repository
