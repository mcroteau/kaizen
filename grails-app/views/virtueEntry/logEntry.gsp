<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="user" />
    <g:set var="entityName" value="${message(code: 'virtueEntry.label', default: 'VirtueEntry')}" />


    <title>Franklins 13 App : Log Virtues or the Day</title>
</head>
<body>


	<div class="content logentry" style="display:none">

		<g:if test="${flash.message}">
			<div class="message info" id="">
				<span class="header">Message : </span>
				<span class="messageDetails">${flash.message}</span>
				<a href="#" class="closeButton closeMessage"></a>
			</div>

	    </g:if>

        <g:hasErrors bean="${virtueEntryInstance}">
        	<div class="errors">
            	<g:renderErrors bean="${virtueEntryInstance}" as="list" />
        	</div>
        </g:hasErrors>


        <g:form action="save" >

			<h1>How did you do on <em><g:datePicker name="entryDate" value="${virtueEntryInstance?.entryDate}" precision="day" years="[2011,2012, 2013]"/></em> ?</h1>

			<div class="virtues left">

				<div class="virtue">
					<g:checkBox name="temperance" value="${virtueEntryInstance?.temperance}"  />
					<em>Temperance</em>
					<span>Eat not to dullness; drink not to elevation</span>		
				</div>


				<div class="virtue">
					<g:checkBox name="orderVirtue" value="${virtueEntryInstance?.orderVirtue}"  />
					<em>Order</em>
					<span>Let all your things have their places; let each part of your business have its time</span>		
				</div>


				<div class="virtue">
					<g:checkBox name="resolution" value="${virtueEntryInstance?.resolution}"  />
					<em>Resolution</em>
					<span>Resolve to perform what you ought; perform without fail what you resolve.</span>		
				</div>


				<div class="virtue">
					<g:checkBox name="frugality" value="${virtueEntryInstance?.frugality}"  />
					<em>Frugality</em>
					<span>Make no expense but to do good to others or yourself; i.e., waste nothing</span>		
				</div>


				<div class="virtue">
					<g:checkBox name="moderation" value="${virtueEntryInstance?.moderation}"  />
					<em>Moderation</em>
					<span>Avoid extremes; forbear resenting injuries so much as you think they deserve.</span>		
				</div>


				<div class="virtue">
					<g:checkBox name="industry" value="${virtueEntryInstance?.industry}"  />
					<em>Industry</em>
					<span>Lose no time; be always employed in something useful; cut off all unnecessary actions.</span>		
				</div>


				<div class="virtue">
					<g:checkBox name="cleanliness" value="${virtueEntryInstance?.cleanliness}"  />
					<em>Cleanliness</em>
					<span>Tolerate no uncleanliness in body, clothes, or habitation.</span>		
				</div>


				<div class="virtue">
					<g:checkBox name="tranquility" value="${virtueEntryInstance?.tranquility}"  />
					<em>Tranquility</em>
					<span>Be not disturbed at trifles, or at accidents common or unavoidable</span>		
				</div>


			</div>


			<div class="virtues right">

				<div class="virtue">
					<g:checkBox name="silence" value="${virtueEntryInstance?.silence}"  />
					<em>Silence</em>
					<span>Speak not but what may benefit others or yourself; avoid trifling conversation</span>		
				</div>


				<div class="virtue">
					<g:checkBox name="sincerity" value="${virtueEntryInstance?.sincerity}"  />
					<em>Sincerity</em>
					<span>Use no hurtful deceit; think innocently and justly, and, if you speak, speak accordingly</span>		
				</div>


				<div class="virtue">
					<g:checkBox name="justice" value="${virtueEntryInstance?.justice}"  />
					<em>Justice</em>
					<span>Wrong none by doing injuries, or omitting the benefits that are your duty.</span>		
				</div>


				<div class="virtue">
					<g:checkBox name="chastity" value="${virtueEntryInstance?.chastity}"  />
					<em>Chastity</em>
					<span>Rarely use venery but for health or offspring, never to dullness, weakness, or the injury of your own or another's peace or reputation</span>		
				</div>


				<div class="virtue">
					<g:checkBox name="humility" value="${virtueEntryInstance?.humility}"  />
					<em>Humility</em>
					<span>Imitate Jesus and Socrates</span>		
				</div>


				<div class="virtue">
					<g:checkBox name="wellBeing" value="${virtueEntryInstance?.wellBeing}"  />
					<em>Well Being</em>
					<span>Take care of your body. Exercise regularly, concentrate on consuming a healthy diet</span>		
				</div>


				<div class="slider">
					<span class="label">Satisfaction with the day?
						<em class="description">Use slider below to select the level of satisfaction 
							on a scale from <em>1</em> to <em>10</em>
						</em>
					</span>

					<input type="text" value="0" id="happinessScaleValue" name="happinessScale"/>

					<br class="clear"/>

					<span class="sliderValue">1</span>
					<span id="happinessScaleSlider" style="width:200px; display:inline-block; margin:20px 0px 0px 0px; border:solid 1px #ddd"></span>
					<span class="sliderValue">10</span>

				</div>
			</div>

			<br class="clear"/>

			<div class="notesHeader">
				<a href="#" class="toggle"></a><span>Notes</span>
			</div>
			<div class="notes notesWrapper" style="display:none">
				<textarea name="notes">${virtueEntryInstance.notes}</textarea>
			</div>

			<div class="buttons">
				<!-- <a href="#" class="button red small">Delete</a>
				<a href="#" class="button blue small">Update</a> -->
				<!-- <a href="#" class="button green small">Save</a> -->
				<g:submitButton name="save" class="button green small" value="Save" />
			</div>

					
        </g:form>

	</div>
	

<script type="text/javascript" src="${resource(dir:'js/lib/jquery/', 'jquery-1.6.1.min.js')}"></script>
<script type="text/javascript" src="${resource(dir:'js/lib/jquery/', 'jquery.qtip.min.js')}"></script>
<script type="text/javascript" src="${resource(dir:'js/lib/jquery/', 'jquery-ui-1.8.16.custom.min.js')}"></script>

<script type="text/javascript">
	
	$(document).ready(function(){
		
		var LogEntry = function(){
			
			var self = this;
			var $toggle = $('.toggle');
			var $notesWrapper = $('.notesWrapper');
			
			self.init = function(){
				self.setupSlider();
				self.bindClickHandler();
				$('.content').fadeIn(500);
			};
			
			self.bindClickHandler = function(){
				$toggle.click(function(event){
					event.preventDefault();
					self.toggleNotes();
				});
			};

			self.toggleNotes = function(){
				$toggle.toggleClass('open');
				$notesWrapper.slideToggle(50);
			};
			
			self.setupSlider = function(){
				$("#happinessScaleSlider").slider({
					min : 0, 
					max : 10,
					value : 5,
					slide : function(event, ui){
						var value = ui.value;
						$('#happinessScaleValue').val(value);
					},
					create : function(event, ui){
						var value = $('#happinessScaleSlider').slider('value');
						$('#happinessScaleValue').val(value);
					} 
				});				
			};
		}
		
		var le = new LogEntry();
		le.init();



		var Messages = function(){
			var self = this;


			self.init = function(){
				bindClickEvent();
			}

			function bindClickEvent(){
				$('.message .closeButton').click(function(event){
					event.preventDefault();
					$(event.target).parent().remove();
				});
			}

			return {
				init : self.init
			}
		}


		var messages = new Messages();
		messages.init();
		
		
	});


</script>

		
</body>
</html>
