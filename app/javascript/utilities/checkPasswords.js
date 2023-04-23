document.addEventListener('turbolinks:load', function() {
  let inputFields = document.querySelectorAll('.check-pwd')

  if (inputFields) inputFields.forEach(field => field.addEventListener('input', checkPasswords))
})

function checkPasswords(e) {
  let pwdInput1 = chooseCurrentInput(e).pwdInput1,
      pwdInput2 = chooseCurrentInput(e).pwdInput2;

  pwdInput1.value === '' || pwdInput2.value === '' ? unHighlightInputs(pwdInput1, pwdInput2) : 
                                                     highlightInputs(pwdInput1, pwdInput2);
}

function chooseCurrentInput(e) {
  let pwdInput1
  let pwdInput2

  if (e.target.classList.contains('pwd')) {
    pwdInput1 = e.target
    pwdInput2 = e.target.parentNode.nextElementSibling.querySelector('.check-pwd')
  } else {
    pwdInput1 = e.target
    pwdInput2 = e.target.parentNode.previousElementSibling.querySelector('.check-pwd')
  }

  return { pwdInput1, pwdInput2 }
}

function highlightInputs(pwdInput1, pwdInput2) {
  pwdInput1.value === pwdInput2.value ? passwordsMatch(pwdInput1, pwdInput2) : 
                                        passwordsNotMatch(pwdInput1, pwdInput2)
}

function unHighlightInputs(pwdInput1, pwdInput2) {
  pwdInput1.classList.remove('error-pwd')
  pwdInput2.classList.remove('error-pwd')
  pwdInput1.classList.remove('accept-pwd')
  pwdInput2.classList.remove('accept-pwd')
}

function passwordsMatch(pwdInput1, pwdInput2) {
  pwdInput1.classList.add('accept-pwd')
  pwdInput2.classList.add('accept-pwd')
  pwdInput1.classList.remove('error-pwd')
  pwdInput2.classList.remove('error-pwd')
}

function passwordsNotMatch(pwdInput1, pwdInput2) {
  pwdInput1.classList.add('error-pwd')
  pwdInput2.classList.add('error-pwd')
  pwdInput1.classList.remove('accept-pwd')
  pwdInput2.classList.remove('accept-pwd')
}

