pragma solidity ^0.8.0;

contract MedicalRecord {

    struct Record {
        string patientName;
        string diagnosis;
        string treatment;
        uint256 timestamp;
    }

    address public admin;
    mapping(address => bool) public doctors;
    mapping(address => Record[]) public patientRecords;

    modifier onlyAdmin() {
        require(msg.sender == admin, "Only admin can perform this action.");
        _;
    }

    modifier onlyDoctor() {
        require(doctors[msg.sender] == true, "Only doctors can perform this action.");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function addDoctor(address _doctor) public onlyAdmin {
        doctors[_doctor] = true;
    }

    function removeDoctor(address _doctor) public onlyAdmin {
        doctors[_doctor] = false;
    }

    function addRecord(address _patient, string memory _diagnosis, string memory _treatment) public onlyDoctor {
        Record memory newRecord = Record({
            patientName: "Patient",
            diagnosis: _diagnosis,
            treatment: _treatment,
            timestamp: block.timestamp
        });

        patientRecords[_patient].push(newRecord);
    }

    function getRecords(address _patient) public view returns (Record[] memory) {
        return patientRecords[_patient];
    }

    function updateRecord(address _patient, uint256 index, string memory _diagnosis, string memory _treatment) public onlyDoctor {
        Record storage record = patientRecords[_patient][index];
        record.diagnosis = _diagnosis;
        record.treatment = _treatment;
    }

    function deleteRecord(address _patient, uint256 index) public onlyAdmin {
        delete patientRecords[_patient][index];
    }
}
