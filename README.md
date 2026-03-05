# WardAI

WardAI is a privacy-preserving AI prompt gateway designed to protect sensitive data when enterprises use generative AI tools.

The system intercepts AI prompts, detects and removes personally identifiable information (PII), and generates cryptographic proof that the prompt was sanitized before being sent to AI models.

---

## Problem

Employees frequently paste sensitive customer data into generative AI tools such as ChatGPT or Claude.

This exposes:

- personal identifiers
- financial data
- medical information
- internal company data

Such exposure may violate privacy regulations like the Digital Personal Data Protection (DPDP) Act.

---

## Solution

WardAI introduces a secure privacy layer between users and AI providers.

Workflow:

1. Browser extension intercepts AI prompts
2. Local NLP detects sensitive information
3. PII is replaced with semantic tokens
4. A Zero-Knowledge Proof verifies masking
5. Proof metadata is recorded on blockchain
6. Only sanitized prompts are sent to AI APIs

---

## Smart Contract

The WardAIVerifier smart contract stores verification metadata for sanitized prompts.

Stored data:

- prompt hash
- number of PII entities removed
- timestamp
- verifier address

This creates a tamper-proof compliance record.

---

## Tech Stack

Frontend
- Chrome Extension (Manifest V3)
- JavaScript

AI Processing
- spaCy NLP
- Named Entity Recognition
- WebAssembly

Privacy & Cryptography
- Zero-Knowledge Proofs
- SHA-256 hashing
- Semantic tokenization

Infrastructure
- FastAPI backend
- Polygon blockchain
- IPFS storage

---

## Example Compliance Event

ComplianceVerified(
  promptHash: 0xabc123...
  piiCount: 5
  timestamp: 1710231123
)

---

## Future Scope

- enterprise AI policy management
- multi-language PII detection
- advanced AI security monitoring
- integration with enterprise SaaS tools

---

## Authors

WardAI Team
