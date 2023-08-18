process MakeFile {
    container 'quay.io/nextflow/bash'
    input: val(name)
    output: path("*")
    script: "echo $name > out.txt"
}

process UseFile {
    container 'quay.io/nextflow/bash'
    debug true
    input: path(infile)
    script: "ls -lha"
}

process UseFileStageInMode {
    container 'quay.io/nextflow/bash'
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