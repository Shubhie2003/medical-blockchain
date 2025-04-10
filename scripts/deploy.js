async function main() {
  const [deployer] = await ethers.getSigners();
  const MedicalRecord = await ethers.getContractFactory("MedicalRecord");
  const record = await MedicalRecord.deploy();

  await record.setMessage("Patient Record");
  console.log(await record.getMessage());
}

main().catch((error) => {
  console.error(error);
  process.exit(1);
});
