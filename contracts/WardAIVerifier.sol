// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/*
WardAI Smart Contract
Purpose:
Store verification proof metadata for sanitized AI prompts.
Ensures tamper-proof compliance logs.
*/

contract WardAIVerifier {

    struct ComplianceRecord {
        bytes32 promptHash;
        uint256 piiCount;
        uint256 timestamp;
        address verifier;
    }

    mapping(bytes32 => ComplianceRecord) public records;

    event ComplianceVerified(
        bytes32 indexed promptHash,
        uint256 piiCount,
        uint256 timestamp,
        address verifier
    );

    function verifyPrompt(
        bytes32 _promptHash,
        uint256 _piiCount
    ) public {

        require(records[_promptHash].timestamp == 0, "Prompt already verified");

        records[_promptHash] = ComplianceRecord({
            promptHash: _promptHash,
            piiCount: _piiCount,
            timestamp: block.timestamp,
            verifier: msg.sender
        });

        emit ComplianceVerified(
            _promptHash,
            _piiCount,
            block.timestamp,
            msg.sender
        );
    }

    function getRecord(bytes32 _promptHash)
        public
        view
        returns (
            bytes32,
            uint256,
            uint256,
            address
        )
    {
        ComplianceRecord memory record = records[_promptHash];

        return (
            record.promptHash,
            record.piiCount,
            record.timestamp,
            record.verifier
        );
    }
}
