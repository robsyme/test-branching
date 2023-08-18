process MakeFile {
    input: val(name)
    output: path("*")
    script: "echo $name > out.txt"
}

process UseFile {
    debug true
    input: path(infile)
    script: "ls -lha"
}

process UseFileStageInMode {
    stageInMode 'copy'
    debug true
    input: path(infile)
    script: "ls -lha"
}

workflow {
    log.info "Success from master branch!"

    Channel.from("Rob")
    | MakeFile
    | (UseFile & UseFileStageInMode)
}