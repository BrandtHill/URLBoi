document.body.addEventListener('phoenix.link.click', e => {
  
  if (e.target.id == 'copy-btn') {
    e.preventDefault()
    let textarea = document.getElementById('full-short-url')
    textarea.select()
    document.execCommand('copy')
    console.log('URL copied!')
  }
})
