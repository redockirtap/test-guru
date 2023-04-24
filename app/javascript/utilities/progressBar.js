document.addEventListener('turbolinks:load', function() {
  let progressBar = document.querySelector('.progress-bar')
  let testProgress = document.querySelector('.progress')
  
  if (progressBar) {
    let progress = testProgress.dataset.testProgress
    progressBar.style.width = `${progress}%`
  }
})
