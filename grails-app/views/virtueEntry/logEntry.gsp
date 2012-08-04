<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="user" />
    <g:set var="entityName" value="${message(code: 'virtueEntry.label', default: 'VirtueEntry')}" />
    <title>Franklins 13 App : Log Principles</title>

</head>
<body>

	<g:hasErrors bean="${virtueEntryInstance}">
		<div class="row">
			<div class="span1 visible-desktop">&nbsp;</div>
			<div class="span10">
				<div class="errors">
	    			<g:renderErrors bean="${virtueEntryInstance}" as="list" />
				</div>
			</div>
			<div class="span1 visible-desktop">&nbsp;</div>
		</div>
	</g:hasErrors>


	
	<g:form action="save">
	
	<style type="text/css">
		select{
			width:auto !important;
			display:inline-block;
		}
	</style>
	<div class="row">
		<div class="span1 visible-desktop">&nbsp;</div>
		<div class="span6">
			<h3>How did you do on <g:datePicker name="entryDate" value="${virtueEntryInstance?.entryDate}" class="span1" precision="day" years="[2011,2012, 2013]"/> ?</h3>
		</div>
		<div class="span4">
			<h2 class="align-right totalCompletedHeader">
				<code><span class="wrapper"><span class="totalCompleted">0</span>/14</span></code>
				<br/>		
				<span class="small-note">completed</span>
			</h2>
		</div>
		<div class="span1 visible-desktop">&nbsp;</div>
	</div>
	


	<div class="row">	
		
		<div class="span1 visible-desktop">&nbsp;</div>
		
		<div class="span5 principles">
				

			<blockquote class="principle">
				<p><g:checkBox name="temperance" value="${virtueEntryInstance?.temperance}"  />
				Temperance</p>
				<small>Eat not to dullness; drink not to elevation</small>		
			</blockquote>
        	
			<blockquote class="principle">
				<p>	<g:checkBox name="orderVirtue" value="${virtueEntryInstance?.orderVirtue}"  />
				Order</p>
				<small>Let all your things have their places; let each part of your business have its time</small>		
			</blockquote>
            
            
			<blockquote class="principle">
				<p><g:checkBox name="resolution" value="${virtueEntryInstance?.resolution}"  />
				Resolution</p>
				<small>Resolve to perform what you ought; perform without fail what you resolve.</small>		
			</blockquote>
            
            
			<blockquote class="principle">
				<p><g:checkBox name="frugality" value="${virtueEntryInstance?.frugality}"  />
				Frugality</p>
				<small>Make no expense but to do good to others or yourself; i.e., waste nothing</small>		
			</blockquote>
            
            
			<blockquote class="principle">
				<p><g:checkBox name="moderation" value="${virtueEntryInstance?.moderation}"  />
				Moderation</p>
				<small>Avoid extremes; forbear resenting injuries so much as you think they deserve.</small>		
			</blockquote>
            
            
			<blockquote class="principle">
				<p><g:checkBox name="industry" value="${virtueEntryInstance?.industry}"  />
				Industry</p>
				<small>Lose no time; be always employed in something useful; cut off all unnecessary actions.</small>		
			</blockquote>
            
            
			<blockquote class="principle">
				<p><g:checkBox name="cleanliness" value="${virtueEntryInstance?.cleanliness}"  />
				Cleanliness</p>
				<small>Tolerate no uncleanliness in body, clothes, or habitation.</small>		
			</blockquote>
            

		</div>


		<div class="span5 principles">
        
		
			<blockquote class="principle">
				<p><g:checkBox name="tranquility" value="${virtueEntryInstance?.tranquility}"  />
				Tranquility</p>
				<small>Be not disturbed at trifles, or at accidents common or unavoidable</small>		
			</blockquote>
			
			<blockquote class="principle">
				<p><g:checkBox name="silence" value="${virtueEntryInstance?.silence}"  />
				Silence</p>
				<small>Speak not but what may benefit others or yourself; avoid trifling conversation</small>		
			</blockquote>
        
        
			<blockquote class="principle">
				<p><g:checkBox name="sincerity" value="${virtueEntryInstance?.sincerity}"  />
				Sincerity</p>
				<small>Use no hurtful deceit; think innocently and justly, and, if you speak, speak accordingly</small>		
			</blockquote>
        
        
			<blockquote class="principle">
				<p><g:checkBox name="justice" value="${virtueEntryInstance?.justice}"  />
				Justice</p>
				<small>Wrong none by doing injuries, or omitting the benefits that are your duty.</small>		
			</blockquote>
        
        
			<blockquote class="principle">
				<p><g:checkBox name="chastity" value="${virtueEntryInstance?.chastity}"  />
				Chastity</p>
				<small>Rarely use venery but for health or offspring, never to dullness, weakness, or the injury of your own or another's peace or reputation</small>		
			</blockquote>
        
        
			<blockquote class="principle">
				<p><g:checkBox name="humility" value="${virtueEntryInstance?.humility}"  />
				Humility</p>
				<small>Imitate Jesus and Socrates</small>		
			</blockquote>
        
        
			<blockquote class="principle">
				<p><g:checkBox name="wellBeing" value="${virtueEntryInstance?.wellBeing}"  />
				Well Being</p>
				<small>Take care of your body. Exercise regularly, concentrate on consuming a healthy diet</small>		
			</blockquote>
        
	   	</div>
        
	   	<div class="span1 visible-desktop">&nbsp;</div>
        
	</div>
       
	<div class="row">
    	
		<div class="span1 visible-desktop">&nbsp;</div>
    	
		<div class="span5">
			<div class="slider well">
				<div class="accordion-group">
					<div class="accordion-heading">
				    	<a href="#collapseOne" data-parent="#accordion2" data-toggle="collapse" class="accordion-toggle">
				      		Notes on Today <span class="toggle-span">+</span>
				    	</a>
				  	</div>
				  	<div class="accordion-body collapse in" id="collapseOne">
				    	<div class="accordion-inner">
							<textarea class="input-xlarge" name="notes" id="textarea" rows="3" style="width:100%;"></textarea>
				    	</div>
				  	</div>
				</div>
			</div>
		</div>
    	
		<div class="span5">  			
			<div class="slider well">
				<h4>Satisfaction with the day?</h4>
				<p>Use slider below to select the level of satisfaction 
					on a scale from <code>1</code> to <code>10</code>
				</p>	
				<div class="align-center">
					<input type="text" value="0" id="happinessScaleValue" name="happinessScale" class="align-center"/>
				</div>
				<div class="align-center">
					<span class="sliderValue">1</span>
					<span id="happinessScaleSlider" style="width:200px; display:inline-block; margin:20px 0px 0px 0px;"></span>
					<span class="sliderValue">10</span>
				</div>
    	
			</div>
		</div>
    	
		<div class="span1 visible-desktop">&nbsp;</div>		
	
	</div>	
		
	
	<div class="row">
		<div class="span1 visible-desktop">&nbsp;</div>
		<div class="span10 align-right">
			<div class="well slider ">
				
				<g:submitButton name="save" class="btn btn-success" value="Save" />
				
				<br style="clear:both"/>
				<br style="clear:both"/>
				<h2 class="align-right totalCompletedHeader">
					<code><span class="wrapper"><span class="totalCompleted">0</span>/14</span></code>
					<br/>		
					<span class="small-note">completed</span>
				</h2>
			</div>
		</div>
		<div class="span1 visible-desktop">&nbsp;</div>
	</div>
	
</g:form>


	
	
	
	

<script type="text/javascript">
	
	$(document).ready(function(){
		
		var LogEntry = function(){
			
			var self = this;
			
			var $principlesB = $('.principles blockquote');
			var $totalDiv = $('.totalCompleted');
			var $totalDivHeader = $('.totalCompletedHeader');
			var $checkboxes = $('.principles input:checkbox');
			
			
			self.init = function(){
				self.setupSlider();
				self.bindClickHandler();
				$('.content').fadeIn(500);
				recalculateTotal();
			};
			
			self.bindClickHandler = function(){
				$principlesB.click(toggleCheckbox);
				$checkboxes.click(recalculateTotal)
			};


			function toggleCheckbox(event){
				var $checkbox;
				var $target = $(event.target);
				
				if($(event.target).is('p') || 
					$(event.target).is('small')){
					$checkbox = $target.parent().find('input:checkbox');
				}else{
					$checkbox = $target.find('input:checkbox');
				}
				if($checkbox.is(':checked')){
					$checkbox.removeAttr('checked');
				}else{
					$checkbox.attr('checked', true);
				}
				recalculateTotal();
			}
			
			
			
			function recalculateTotal(){
				$totalDiv.empty();
				var total = 0;
				$checkboxes.each(function(index, checkbox){
					if($(checkbox).is(':checked'))total++;
				});
				$totalDiv.html(total);
				if(total < 6)$totalDiv.addClass('poor').removeClass('average').removeClass('good');
				if(total > 6 && total < 10)$totalDiv.addClass('average').removeClass('poor').removeClass('good');
				if(total > 10)$totalDiv.addClass('good').removeClass('average').removeClass('poor');
				
				if(total === 14){
					$totalDivHeader.find('.wrapper').html('100%').addClass('average');
					$totalDivHeader.find('.small-note').html('perfect!');
				}else{
					$totalDivHeader.find('.wrapper').html('<span class="totalCompleted">' + total + '</span>/14').removeClass('average');
					$totalDivHeader.find('.small-note').html('complete');
				}
			}
			
			
			
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
