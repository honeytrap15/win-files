function gitcd
{
	$d=Get-ChildItem -Name -Attributes Directory -Depth 3 ${HOME}/git | peco
    cd ${HOME}/git/$d
}

function gocd
{
	$d=Get-ChildItem -Name -Attributes Directory -Depth 3 ${HOME}/go/src | peco
    cd ${HOME}/go/src/$d
}

function gitclone($name)
{
    $repo = ""
    if (${name}.StartsWith("git@")) {
        $sep = ${name}.Replace("git@", "")
        $repo = ${sep}.Split(":")[0] + "/" + ${sep}.Split(":")[1].Replace(".git", "")
    }
    if (${name}.StartsWith("https")) {
        $repo = ${name}.Replace("https://", "").Replace(".git", "")
    }

    git clone ${name} ${HOME}/git/${repo}
}
