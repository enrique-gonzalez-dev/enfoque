if ($('#summernote')[0]) {
$('#summernote').summernote({
        height: 300,
        lang: 'es-ES',
        disableDragAndDrop: true,
    	toolbar: [
			['style', ['bold', 'italic', 'underline', 'clear']],
			['font', ['strikethrough', 'superscript', 'subscript']],
			['insert', ['picture']],
			['para', ['ul', 'ol', 'paragraph']],
		],

		onImageUpload: function(files, editor, welEditable)
		{
			onLoadImage(files, editor, welEditable);
			//$('.html-editor').summernote('insertNode', imgNode);
		},

		 onPaste: function(e)
		 {
		    var thisNote = $(this);
            var updatePastedText = function(someNote){
                var original = someNote.code();
                var cleaned = CleanPastedHTML(original); //this is where to call whatever clean function you want. I have mine in a different file, called CleanPastedHTML.
               //someNote.code('').html(cleaned); //this sets the displayed content editor to the cleaned pasted code.
                someNote.code(cleaned);
            };
            setTimeout(function () {
                //this kinda sucks, but if you don't do a setTimeout, 
                //the function is called before the text is really pasted.
                updatePastedText(thisNote);
            }, 10);
		 }
    });

	$('#summernote').summernote('fontSize', 16);
}

function CleanPastedHTML(input) {
  // 1. remove line breaks / Mso classes
  var stringStripper = /(\n|\r| class=(")?Mso[a-zA-Z]+(")?)/g;
  var output = input.replace(stringStripper, ' ');
  // 2. strip Word generated HTML comments
  var commentSripper = new RegExp('<!--(.*?)-->','g');
  var output = output.replace(commentSripper, '');
  var tagStripper = new RegExp('<(/)*(meta|link|img|span|\\?xml:|st1:|o:|font)(.*?)>','gi');
  // 3. remove tags leave content if any
  output = output.replace(tagStripper, '');
  // 4. Remove everything in between and including tags '<style(.)style(.)>'
  var badTags = ['style', 'script','applet','embed','noframes','noscript','img'];

  for (var i=0; i< badTags.length; i++) {
    tagStripper = new RegExp('<'+badTags[i]+'.*?'+badTags[i]+'(.*?)>', 'gi');
    output = output.replace(tagStripper, '');
  }
  // 5. remove attributes ' style="..."'
  var badAttributes = ['style', 'start'];
  for (var i=0; i< badAttributes.length; i++) {
    var attributeStripper = new RegExp(' ' + badAttributes[i] + '="(.*?)"','gi');
    output = output.replace(attributeStripper, '');
  }
  return output;
}



function onLoadImage(files, editor, welEditable)
{
//	console.log('image upload:', files[0]);
    var submitFormData = new FormData();
    submitFormData.append('image', files[0]);
    
	var xmlhttp = new XMLHttpRequest();
	
	xmlhttp.onreadystatechange = function()
	{
	    if(xmlhttp.readyState == 4)
	    {
	        var response = xmlhttp.responseText;
	    //    console.log("Request response= " + response);
	        var jsonres = JSON.parse(response);
	        var status = jsonres.status;
	        var url = jsonres.url;

	        if (xmlhttp.status == 200 )
	        {
	        //   console.log("URL= " + url );
	       //    editor.insertImage(welEditable, url);
	           var ret = $(".html-editor").summernote("insertImage", url, jsonres.id); 
	        }
	    }
	}
	xmlhttp.open("POST", "/field_images/upload", true);
	xmlhttp.setRequestHeader('X-CSRF-Token', $('meta[name=csrf-token]').attr('content'));
	xmlhttp.send(submitFormData);
}

