'use strict';
exports.read_a_task = function(req, res) {
    const fs = require('fs');
    const zip_to_cbsa = './data/zip_to_cbsa.csv';
    const cbsa_to_msa = './data/cbsa_to_msa.csv';
    const rr = fs.createReadStream(zip_to_cbsa);
    var ZipCodeArr =req.query.zip ;
    var a;
    console.log(ZipCodeArr);
    rr.on('readable', () => {
        a = `${rr.read()}`;
        console.log(a.length);
    });
    rr.on('end', () => {
        console.log(a);
        res.json(a);
    });


    // fs.readFile(zip_to_cbsa, 'utf8', function(err, zipFileData) {
    //     if (err){
    //         console.log(err)
    //         res.send(err);
    //     }
    //     console.log(zipFileData)
    //     var zipFileDataLines = zipFileData.split("\n"),
    //         zipCols = [];
    //     //get Zip and CBSA
    //
    //     for (var i=1;i<zipFileDataLines.length;i++){
    //       console.log(zipFileDataLines[i])
    //       console.log("NewLine1")
    //         zipCols.push(zipFileDataLines[i].split(","));
    //
    //     }
    //     console.log(zipCols);
    //
    //     res.json(zipCols);
    // });

    // fs.open('api/controller/file.txt', 'r', (err, fd) => {
    //     if (err) throw err;
    //     fs.fstat(fd, (err, stat) => {
    //         if (err) res.send(err);
    //         // use stat
    //         console.log(stat)
    //         res.json("fd value is passed: "+ fd)
    //         // always close the file descriptor!
    //         fs.close(fd, (err) => {
    //             if (err) res.send(err);
    //         });
    //     });
    // });
};
