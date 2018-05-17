'use strict';
exports.read_a_task = function(req, res) {
    const fs = require('fs');
    const path = './data/cbsa_to_msa.csv';
    const rr = fs.createReadStream(path);
    var a ;
    // rr.on('readable', () => {
    //     a = `${rr.read()}`;
    //     console.log(a);
    // });
    // rr.on('end', () => {
    //     console.log(a);
    //     res.json(a);
    // });


    fs.readFile(path, 'utf8', function(err, data) {
        if (err){
            // console.log(err)
            res.send(err);
        }

        // console.log('OK: ' + filename);
        var dataLines = data.split("\n")
        for (var i=0;i<10;i++){
          console.log(dataLines[i])

          console.log("NewLine1")
        }
        debugger;
        console.log("Test");

        //res.json(data);
    });

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
