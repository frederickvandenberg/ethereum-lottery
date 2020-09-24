// Requirements
const path = require('path')
const fs = require('fs')
const solc = require('solc')

// Set up path
const lotteryPath = path.resolve(__dirname, 'contracts', 'Lottery.sol');
const source = fs.readFileSync(lotteryPath, 'utf8');

// Compile statement
module.exports = solc.compile(source, 1).contracts[':Lottery'];