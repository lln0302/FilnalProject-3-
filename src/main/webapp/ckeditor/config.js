/**
 * @license Copyright (c) 2003-2022, CKSource Holding sp. z o.o. All rights reserved.
 * For licensing, see https://ckeditor.com/legal/ckeditor-oss-license
 */

CKEDITOR.editorConfig = function( config ) {
	// Define changes to default configuration here. For example:
	// config.language = 'fr';
	// config.uiColor = '#AADC6E';
	config.toolbar = [
	
	        ['Font', 'FontSize'],
	
	        ['BGColor', 'TextColor' ],
	
	        ['Bold', 'Italic', 'Strike', 'Superscript', 'Subscript', 'Underline', 'RemoveFormat'],   
	
	        ['BidiLtr', 'BidiRtl'],
		
	        ['insertTable', 'Image', 'SpecialChar', 'Smiley'],
	
	        ['JustifyLeft', 'JustifyCenter', 'JustifyRight', 'JustifyBlock'],
	
	        ['Blockquote', 'NumberedList', 'BulletedList'],
	
	        ['Link', 'Unlink'],
	
	        ['Source'],
	
	];
	
	config.editorplaceholder = '이미지를 첨부할 경우에는 한 개만 첨부해주세요.';
	
};
