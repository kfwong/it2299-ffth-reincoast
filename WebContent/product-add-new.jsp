<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- header.jsp -->
<jsp:include page="header.jsp">
	<jsp:param value="//cdnjs.cloudflare.com/ajax/libs/chosen/1.0/chosen.min.css" name="css" />
</jsp:include>
<style>
.chosen-container-multi .chosen-choices li.search-field input[type="text"] { min-height: 25px; }
.chosen-choices{border-radius:3px;border: 1px solid rgb(204, 204, 204) !important;background-image: none !important;}
label.error{font-weight: normal;font-size:12px;color:red;font-style:italic;}	
</style>
<!-- header.jsp -->

<!-- sidebar.jsp -->
<jsp:include page="sidebar.jsp"></jsp:include>
<!-- sidebar.jsp -->

<!-- sample-content.jsp -->
<div id="page-wrapper">
	<form id="p_form" method="post" action="/it2299-ffth-reincoast/ProductRegistrationServlet" role="form">
		<div class="row">
			<div class="col-lg-12">
				<div class="page-header">
					<h1>
						Product <small>Add New</small>
					</h1>
				</div>
				<ol class="breadcrumb">
					<li><a href="#"><i class="icon-dashboard"></i> Home</a></li>
					<li class="active"><i class="icon-edit"></i> Register New Product</li>
				</ol>
			</div>
		</div>
		<!-- /.row -->

		<div class="row">
			<div class="col-lg-7">
				<div class="panel panel-default">
					<div class="panel-body">
						<h4>
							<label>Primary Details</label>
							<div class="form-group pull-right" style="padding: 0px 10px 0px 10px;">
								<div class="btn-group">
									<button id="p_import" type="button" class="btn btn-xs btn-default" data-content="<small><i class='glyphicon glyphicon-repeat'></i>&nbsp;Hacking NTUC database...<small>" data-toggle="modal" data-placement="left" data-html="true" data-container="body" data-trigger="manual" data-target="#myModal">
										<i class="glyphicon glyphicon-import"></i> Import
									</button>
									<button id="p_action" type="submit" class="btn btn-xs btn-default" name="p_action" value="Submit">
										<i class="glyphicon glyphicon-ok"></i> Submit
									</button>
								</div>
							</div>
						</h4>
						<div class="form-group">
							<label class="control-label">Name</label>
							<small class="help-block">The display name of the item.</small>
							<input id="p_name" class="form-control input-sm" name="p_name">
						</div>

						<div class="form-group">
							<label>Description</label>
							<small class="help-block">The short description of the item.</small>
							<textarea class="form-control input-sm" rows="3" name="p_description"></textarea>
						</div>
						<div class="form-group">
							<label class="control-label">Code</label>
							<small class="help-block">i.e. Barcode</small> 
							<input class="form-control input-sm" name="p_code">
						</div>

						<div class="form-group">
							<label>Unit of Measure</label> 
							<input class="form-control input-sm" name="p_unit_of_measure">
						</div>

						<div class="form-group">
							<label>Price</label>
							<small class="help-block">In Singapore Dollar (SGD).</small>
							<input id="p_price" class="form-control input-sm" name="p_price">
						</div>
						<div class="form-group">
							<label>Weight</label>
							<small class="help-block">In grams (G)</small>
							<input id="p_weight" class="form-control input-sm" name="p_weight">
						</div>
						<div class="form-group">
							<label>Category</label>
							<small class="help-block">Categorize your product. <a href="#"><i>Click here to add more choices into the list.</i></a></small>
							<select id="p_category" class="form-control input-sm" name="p_category" data-placeholder="Choose categories..." tabindex="1" multiple="true">
					            <option value=""></option>
					            <option value="United States">United States</option>
					            <option value="United Kingdom">United Kingdom</option>
					            <option value="Afghanistan">Afghanistan</option>
					            <option value="Aland Islands">Aland Islands</option>
					            <option value="Albania">Albania</option>
					            <option value="Algeria">Algeria</option>
					            <option value="American Samoa">American Samoa</option>
					            <option value="Andorra">Andorra</option>
					            <option value="Angola">Angola</option>
					            <option value="Anguilla">Anguilla</option>
					            <option value="Antarctica">Antarctica</option>
					            <option value="Antigua and Barbuda">Antigua and Barbuda</option>
					            <option value="Argentina">Argentina</option>
					            <option value="Armenia">Armenia</option>
					            <option value="Aruba">Aruba</option>
					            <option value="Australia">Australia</option>
					            <option value="Austria">Austria</option>
					            <option value="Azerbaijan">Azerbaijan</option>
					            <option value="Bahamas">Bahamas</option>
					            <option value="Bahrain">Bahrain</option>
					            <option value="Bangladesh">Bangladesh</option>
					            <option value="Barbados">Barbados</option>
					            <option value="Belarus">Belarus</option>
					            <option value="Belgium">Belgium</option>
					            <option value="Belize">Belize</option>
					            <option value="Benin">Benin</option>
					            <option value="Bermuda">Bermuda</option>
					            <option value="Bhutan">Bhutan</option>
					            <option value="Bolivia, Plurinational State of">Bolivia, Plurinational State of</option>
					            <option value="Bonaire, Sint Eustatius and Saba">Bonaire, Sint Eustatius and Saba</option>
					            <option value="Bosnia and Herzegovina">Bosnia and Herzegovina</option>
					            <option value="Botswana">Botswana</option>
					            <option value="Bouvet Island">Bouvet Island</option>
					            <option value="Brazil">Brazil</option>
					            <option value="British Indian Ocean Territory">British Indian Ocean Territory</option>
					            <option value="Brunei Darussalam">Brunei Darussalam</option>
					            <option value="Bulgaria">Bulgaria</option>
					            <option value="Burkina Faso">Burkina Faso</option>
					            <option value="Burundi">Burundi</option>
					            <option value="Cambodia">Cambodia</option>
					            <option value="Cameroon">Cameroon</option>
					            <option value="Canada">Canada</option>
					            <option value="Cape Verde">Cape Verde</option>
					            <option value="Cayman Islands">Cayman Islands</option>
					            <option value="Central African Republic">Central African Republic</option>
					            <option value="Chad">Chad</option>
					            <option value="Chile">Chile</option>
					            <option value="China">China</option>
					            <option value="Christmas Island">Christmas Island</option>
					            <option value="Cocos (Keeling) Islands">Cocos (Keeling) Islands</option>
					            <option value="Colombia">Colombia</option>
					            <option value="Comoros">Comoros</option>
					            <option value="Congo">Congo</option>
					            <option value="Congo, The Democratic Republic of The">Congo, The Democratic Republic of The</option>
					            <option value="Cook Islands">Cook Islands</option>
					            <option value="Costa Rica">Costa Rica</option>
					            <option value="Cote D'ivoire">Cote D'ivoire</option>
					            <option value="Croatia">Croatia</option>
					            <option value="Cuba">Cuba</option>
					            <option value="Curacao">Curacao</option>
					            <option value="Cyprus">Cyprus</option>
					            <option value="Czech Republic">Czech Republic</option>
					            <option value="Denmark">Denmark</option>
					            <option value="Djibouti">Djibouti</option>
					            <option value="Dominica">Dominica</option>
					            <option value="Dominican Republic">Dominican Republic</option>
					            <option value="Ecuador">Ecuador</option>
					            <option value="Egypt">Egypt</option>
					            <option value="El Salvador">El Salvador</option>
					            <option value="Equatorial Guinea">Equatorial Guinea</option>
					            <option value="Eritrea">Eritrea</option>
					            <option value="Estonia">Estonia</option>
					            <option value="Ethiopia">Ethiopia</option>
					            <option value="Falkland Islands (Malvinas)">Falkland Islands (Malvinas)</option>
					            <option value="Faroe Islands">Faroe Islands</option>
					            <option value="Fiji">Fiji</option>
					            <option value="Finland">Finland</option>
					            <option value="France">France</option>
					            <option value="French Guiana">French Guiana</option>
					            <option value="French Polynesia">French Polynesia</option>
					            <option value="French Southern Territories">French Southern Territories</option>
					            <option value="Gabon">Gabon</option>
					            <option value="Gambia">Gambia</option>
					            <option value="Georgia">Georgia</option>
					            <option value="Germany">Germany</option>
					            <option value="Ghana">Ghana</option>
					            <option value="Gibraltar">Gibraltar</option>
					            <option value="Greece">Greece</option>
					            <option value="Greenland">Greenland</option>
					            <option value="Grenada">Grenada</option>
					            <option value="Guadeloupe">Guadeloupe</option>
					            <option value="Guam">Guam</option>
					            <option value="Guatemala">Guatemala</option>
					            <option value="Guernsey">Guernsey</option>
					            <option value="Guinea">Guinea</option>
					            <option value="Guinea-bissau">Guinea-bissau</option>
					            <option value="Guyana">Guyana</option>
					            <option value="Haiti">Haiti</option>
					            <option value="Heard Island and Mcdonald Islands">Heard Island and Mcdonald Islands</option>
					            <option value="Holy See (Vatican City State)">Holy See (Vatican City State)</option>
					            <option value="Honduras">Honduras</option>
					            <option value="Hong Kong">Hong Kong</option>
					            <option value="Hungary">Hungary</option>
					            <option value="Iceland">Iceland</option>
					            <option value="India">India</option>
					            <option value="Indonesia">Indonesia</option>
					            <option value="Iran, Islamic Republic of">Iran, Islamic Republic of</option>
					            <option value="Iraq">Iraq</option>
					            <option value="Ireland">Ireland</option>
					            <option value="Isle of Man">Isle of Man</option>
					            <option value="Israel">Israel</option>
					            <option value="Italy">Italy</option>
					            <option value="Jamaica">Jamaica</option>
					            <option value="Japan">Japan</option>
					            <option value="Jersey">Jersey</option>
					            <option value="Jordan">Jordan</option>
					            <option value="Kazakhstan">Kazakhstan</option>
					            <option value="Kenya">Kenya</option>
					            <option value="Kiribati">Kiribati</option>
					            <option value="Korea, Democratic People's Republic of">Korea, Democratic People's Republic of</option>
					            <option value="Korea, Republic of">Korea, Republic of</option>
					            <option value="Kuwait">Kuwait</option>
					            <option value="Kyrgyzstan">Kyrgyzstan</option>
					            <option value="Lao People's Democratic Republic">Lao People's Democratic Republic</option>
					            <option value="Latvia">Latvia</option>
					            <option value="Lebanon">Lebanon</option>
					            <option value="Lesotho">Lesotho</option>
					            <option value="Liberia">Liberia</option>
					            <option value="Libya">Libya</option>
					            <option value="Liechtenstein">Liechtenstein</option>
					            <option value="Lithuania">Lithuania</option>
					            <option value="Luxembourg">Luxembourg</option>
					            <option value="Macao">Macao</option>
					            <option value="Macedonia, The Former Yugoslav Republic of">Macedonia, The Former Yugoslav Republic of</option>
					            <option value="Madagascar">Madagascar</option>
					            <option value="Malawi">Malawi</option>
					            <option value="Malaysia">Malaysia</option>
					            <option value="Maldives">Maldives</option>
					            <option value="Mali">Mali</option>
					            <option value="Malta">Malta</option>
					            <option value="Marshall Islands">Marshall Islands</option>
					            <option value="Martinique">Martinique</option>
					            <option value="Mauritania">Mauritania</option>
					            <option value="Mauritius">Mauritius</option>
					            <option value="Mayotte">Mayotte</option>
					            <option value="Mexico">Mexico</option>
					            <option value="Micronesia, Federated States of">Micronesia, Federated States of</option>
					            <option value="Moldova, Republic of">Moldova, Republic of</option>
					            <option value="Monaco">Monaco</option>
					            <option value="Mongolia">Mongolia</option>
					            <option value="Montenegro">Montenegro</option>
					            <option value="Montserrat">Montserrat</option>
					            <option value="Morocco">Morocco</option>
					            <option value="Mozambique">Mozambique</option>
					            <option value="Myanmar">Myanmar</option>
					            <option value="Namibia">Namibia</option>
					            <option value="Nauru">Nauru</option>
					            <option value="Nepal">Nepal</option>
					            <option value="Netherlands">Netherlands</option>
					            <option value="New Caledonia">New Caledonia</option>
					            <option value="New Zealand">New Zealand</option>
					            <option value="Nicaragua">Nicaragua</option>
					            <option value="Niger">Niger</option>
					            <option value="Nigeria">Nigeria</option>
					            <option value="Niue">Niue</option>
					            <option value="Norfolk Island">Norfolk Island</option>
					            <option value="Northern Mariana Islands">Northern Mariana Islands</option>
					            <option value="Norway">Norway</option>
					            <option value="Oman">Oman</option>
					            <option value="Pakistan">Pakistan</option>
					            <option value="Palau">Palau</option>
					            <option value="Palestinian Territory, Occupied">Palestinian Territory, Occupied</option>
					            <option value="Panama">Panama</option>
					            <option value="Papua New Guinea">Papua New Guinea</option>
					            <option value="Paraguay">Paraguay</option>
					            <option value="Peru">Peru</option>
					            <option value="Philippines">Philippines</option>
					            <option value="Pitcairn">Pitcairn</option>
					            <option value="Poland">Poland</option>
					            <option value="Portugal">Portugal</option>
					            <option value="Puerto Rico">Puerto Rico</option>
					            <option value="Qatar">Qatar</option>
					            <option value="Reunion">Reunion</option>
					            <option value="Romania">Romania</option>
					            <option value="Russian Federation">Russian Federation</option>
					            <option value="Rwanda">Rwanda</option>
					            <option value="Saint Barthelemy">Saint Barthelemy</option>
					            <option value="Saint Helena, Ascension and Tristan da Cunha">Saint Helena, Ascension and Tristan da Cunha</option>
					            <option value="Saint Kitts and Nevis">Saint Kitts and Nevis</option>
					            <option value="Saint Lucia">Saint Lucia</option>
					            <option value="Saint Martin (French part)">Saint Martin (French part)</option>
					            <option value="Saint Pierre and Miquelon">Saint Pierre and Miquelon</option>
					            <option value="Saint Vincent and The Grenadines">Saint Vincent and The Grenadines</option>
					            <option value="Samoa">Samoa</option>
					            <option value="San Marino">San Marino</option>
					            <option value="Sao Tome and Principe">Sao Tome and Principe</option>
					            <option value="Saudi Arabia">Saudi Arabia</option>
					            <option value="Senegal">Senegal</option>
					            <option value="Serbia">Serbia</option>
					            <option value="Seychelles">Seychelles</option>
					            <option value="Sierra Leone">Sierra Leone</option>
					            <option value="Singapore">Singapore</option>
					            <option value="Sint Maarten (Dutch part)">Sint Maarten (Dutch part)</option>
					            <option value="Slovakia">Slovakia</option>
					            <option value="Slovenia">Slovenia</option>
					            <option value="Solomon Islands">Solomon Islands</option>
					            <option value="Somalia">Somalia</option>
					            <option value="South Africa">South Africa</option>
					            <option value="South Georgia and The South Sandwich Islands">South Georgia and The South Sandwich Islands</option>
					            <option value="South Sudan">South Sudan</option>
					            <option value="Spain">Spain</option>
					            <option value="Sri Lanka">Sri Lanka</option>
					            <option value="Sudan">Sudan</option>
					            <option value="Suriname">Suriname</option>
					            <option value="Svalbard and Jan Mayen">Svalbard and Jan Mayen</option>
					            <option value="Swaziland">Swaziland</option>
					            <option value="Sweden">Sweden</option>
					            <option value="Switzerland">Switzerland</option>
					            <option value="Syrian Arab Republic">Syrian Arab Republic</option>
					            <option value="Taiwan, Province of China">Taiwan, Province of China</option>
					            <option value="Tajikistan">Tajikistan</option>
					            <option value="Tanzania, United Republic of">Tanzania, United Republic of</option>
					            <option value="Thailand">Thailand</option>
					            <option value="Timor-leste">Timor-leste</option>
					            <option value="Togo">Togo</option>
					            <option value="Tokelau">Tokelau</option>
					            <option value="Tonga">Tonga</option>
					            <option value="Trinidad and Tobago">Trinidad and Tobago</option>
					            <option value="Tunisia">Tunisia</option>
					            <option value="Turkey">Turkey</option>
					            <option value="Turkmenistan">Turkmenistan</option>
					            <option value="Turks and Caicos Islands">Turks and Caicos Islands</option>
					            <option value="Tuvalu">Tuvalu</option>
					            <option value="Uganda">Uganda</option>
					            <option value="Ukraine">Ukraine</option>
					            <option value="United Arab Emirates">United Arab Emirates</option>
					            <option value="United Kingdom">United Kingdom</option>
					            <option value="United States">United States</option>
					            <option value="United States Minor Outlying Islands">United States Minor Outlying Islands</option>
					            <option value="Uruguay">Uruguay</option>
					            <option value="Uzbekistan">Uzbekistan</option>
					            <option value="Vanuatu">Vanuatu</option>
					            <option value="Venezuela, Bolivarian Republic of">Venezuela, Bolivarian Republic of</option>
					            <option value="Viet Nam">Viet Nam</option>
					            <option value="Virgin Islands, British">Virgin Islands, British</option>
					            <option value="Virgin Islands, U.S.">Virgin Islands, U.S.</option>
					            <option value="Wallis and Futuna">Wallis and Futuna</option>
					            <option value="Western Sahara">Western Sahara</option>
					            <option value="Yemen">Yemen</option>
					            <option value="Zambia">Zambia</option>
					            <option value="Zimbabwe">Zimbabwe</option>
					          </select>
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-5">
				<div class="panel panel-default">
					<div class="panel-body">
						<h4>
							<label>Image</label>
							<div class="form-group pull-right" style="padding: 0px 10px 0px 10px;">
								<div class="btn-group">
									<button type="button" class="btn btn-xs btn-default">
										<i class="glyphicon glyphicon-hdd"></i> Browse
									</button>
									<button type="button" class="btn btn-xs btn-default">
										<i class="glyphicon glyphicon-remove"></i> Clear
									</button>
								</div>
							</div>
						</h4>
						<div class="row">
							<div class="col-lg-7">
								<p>Upload an image of this product.</p>
								<small>
									<ul>
										<li>Recommend dimension is 160x160px.</li>
										<li>Bigger image will be cropped.</li>
										<li>You can also make use of import feature to import image from NTUC website, if available.</li>
									</ul>
								</small>
							</div>
							<div class="col-lg-5">
								<div style="width:160px;height:100%;">
									<a href="#" class="thumbnail">
								      <img id="p_image" src="http://placehold.it/160x160">
								    </a>
								</div>	
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-5">
				<div class="panel panel-default">
					<div class="panel-body">
						<h4>
							<label>Additional Data</label>
						</h4>
						<span>Customize your data by adding more fields to the form.</span>
					</div>
					<table class="table">
						<tbody id="p_meta_fields">
							<tr>
								<td class="col-sm-3" style="padding-left: 14px;"><input class="form-control input-sm" placeholder="key" name="p_meta_key"></td>
								<td><input class="form-control input-sm" placeholder="value" name="p_meta_value"></td>
							</tr>
							<tr>
								<td class="col-sm-3" style="padding-left: 14px;"><input class="form-control input-sm" placeholder="key" name="p_meta_key"></td>
								<td><input class="form-control input-sm" placeholder="value" name="p_meta_value"></td>
							</tr>
							<tr>
								<td class="col-sm-3" style="padding-left: 14px;"><input class="form-control input-sm" placeholder="key" name="p_meta_key"></td>
								<td><input class="form-control input-sm" placeholder="value" name="p_meta_value"></td>
							</tr>
						</tbody>
					</table>
					<div class="panel-footer">
						<div class="form-group pull-right" style="padding: 0px 10px 0px 10px;">
							<div class="btn-group">
								<button id="p_add_meta_field" type="button" class="btn btn-xs btn-default">
									<i class="icon-plus"></i> Add field
								</button>
							</div>
						</div>
						&nbsp;
					</div>
				</div>
			</div>
		</div>
	</form>
	<!-- Modal -->
	<div class="modal" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	        <h4 class="modal-title" id="myModalLabel">Import</h4>
	      </div>
	      <div class="modal-body">
	        <p>Copy the product URL from NTUC website:</p>
	        <input id="p_import_url" class="form-control input-sm" type="text"/>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	        <button id="p_import_submit" type="button" class="btn btn-primary" data-dismiss="modal">Import</button>
	      </div>
	    </div><!-- /.modal-content -->
	  </div><!-- /.modal-dialog -->
	</div><!-- /.modal -->
		
	<!-- sample-content.jsp -->

	<!-- footer.jsp -->
	<jsp:include page="footer.jsp">
		<jsp:param value="//cdnjs.cloudflare.com/ajax/libs/chosen/1.0/chosen.jquery.min.js" name="js" />
		<jsp:param value="//cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.11.1/jquery.validate.min.js" name="js" />
	</jsp:include>
	<!-- footer.jsp -->
	<script type="text/javascript">
	$(document).ready(function(){		
		$("#p_import_submit").on("click", function(e){
			$('#p_import').popover('show');
			$.ajax({
				type: "POST",
				url: "ProductImportServlet",
				data: {
					p_import_url: $('#p_import_url').val()
				}
			}).done(function(response){
				$('#p_import').popover('hide');
				var data = $.parseJSON(response);

				$('#p_name').val(data.name);
				$('#p_weight').val(data.weight);
				$('#p_price').val(data.price);
				$('#p_image').attr('src', data.image);
			});
		});

		$('#p_add_meta_field').on("click", function(e){
			$('#p_meta_fields').append(
					'<tr>'+
						'<td class="col-sm-3" style="padding-left: 14px;"><input class="form-control input-sm" placeholder="key" name="p_meta_key"></td>'+
						'<td><input class="form-control input-sm" placeholder="value" name="p_meta_value"></td>'+
					'</tr>'
			);
				
		});

		$('#p_category').chosen();

		$.validator.addMethod("money", function(value, element) {
		    return this.optional(element) || /^(\d{1,9})(\.\d{1,2})?$/.test(value);
		}, "Must be in US currency format 0.99");

		$('#p_form').validate({
			rules:{
				p_weight:{
					number: true
				},
				p_price:{
					money: true
				}
			}
		});
	});
	</script>