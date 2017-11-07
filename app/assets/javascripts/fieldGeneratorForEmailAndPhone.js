function addEmailOrPhoneFieldToContacts(fieldAttributeName){
  var displayName, cssClassName;
  if(fieldAttributeName === 'email'){
    displayName = 'Email';
    fieldDivId = '#contact_emails';
  }
  else {
    displayName = 'Teléfono';
    fieldDivId = '#contact_phone_numbers';
  }
  var generatedField = [
    '<div class="form-group input-group"><input type="text" autocomplete="off" name="contact[',
    fieldAttributeName,
    's][]" class="form-control ',
    fieldAttributeName+'-field" placeholder="',
    displayName,
    '"><span class="input-group-btn"><button onclick="deleteClosestInputGroup(this)" ',
    'tabindex="-1" class="btn btn-flat btn-asoban-inverse" type="button"><span class="glyphicon ',
    'glyphicon-remove"></span></button></span></div>'
  ].join('');
  $('.'+fieldAttributeName+'s-div').append(generatedField);
}

function deleteClosestInputGroup(element){
  $(element).closest('.input-group').remove();
}
