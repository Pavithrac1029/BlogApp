class HomeContentModel {
	String? _object;
	List<Results>? _results;
	Null? _nextCursor;
	bool? _hasMore;
	String? _type;
//	Block? _block;
	String? _developerSurvey;

	HomeContentModel({String? object, List<Results>? results, Null? nextCursor, bool? hasMore,  String? developerSurvey}) {
if (object != null) {
this._object = object;
}
if (results != null) {
this._results = results;
}
if (nextCursor != null) {
this._nextCursor = nextCursor;
}
if (hasMore != null) {
this._hasMore = hasMore;
}
if (type != null) {
this._type = type;
}
// if (block != null) {
// this._block = block;
// }
if (developerSurvey != null) {
this._developerSurvey = developerSurvey;
}
}

	String? get object => _object;
	set object(String? object) => _object = object;
	List<Results>? get results => _results;
	set results(List<Results>? results) => _results = results;
	Null? get nextCursor => _nextCursor;
	set nextCursor(Null? nextCursor) => _nextCursor = nextCursor;
	bool? get hasMore => _hasMore;
	set hasMore(bool? hasMore) => _hasMore = hasMore;
	String? get type => _type;
	set type(String? type) => _type = type;
	// Block? get block => _block;
	// set block(Block? block) => _block = block;
	String? get developerSurvey => _developerSurvey;
	set developerSurvey(String? developerSurvey) => _developerSurvey = developerSurvey;

	HomeContentModel.fromJson(Map<String, dynamic> json) {
		_object = json['object'];
		if (json['results'] != null) {
			_results = <Results>[];
			json['results'].forEach((v) { _results!.add(new Results.fromJson(v)); });
		}
		_nextCursor = json['next_cursor'];
		_hasMore = json['has_more'];
		_type = json['type'];
	//	_block = json['block'] != null ? new Block.fromJson(json['block']) : null;
		_developerSurvey = json['developer_survey'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['object'] = this._object;
		if (this._results != null) {
      data['results'] = this._results!.map((v) => v.toJson()).toList();
    }
		data['next_cursor'] = this._nextCursor;
		data['has_more'] = this._hasMore;
		data['type'] = this._type;
		// if (this._block != null) {
    //   data['block'] = this._block!.toJson();
    // }
		data['developer_survey'] = this._developerSurvey;
		return data;
	}
}

class Results {
	String? _object;
	String? _id;
	Parent? _parent;
	String? _createdTime;
	String? _lastEditedTime;
	CreatedBy? _createdBy;
	CreatedBy? _lastEditedBy;
	bool? _hasChildren;
	bool? _archived;
	String? _type;
	Paragraph? _paragraph;
	Image? _image;

	Results({String? object, String? id, Parent? parent, String? createdTime, String? lastEditedTime, CreatedBy? createdBy, CreatedBy? lastEditedBy, bool? hasChildren, bool? archived, String? type, Paragraph? paragraph, Image? image}) {
if (object != null) {
this._object = object;
}
if (id != null) {
this._id = id;
}
if (parent != null) {
this._parent = parent;
}
if (createdTime != null) {
this._createdTime = createdTime;
}
if (lastEditedTime != null) {
this._lastEditedTime = lastEditedTime;
}
if (createdBy != null) {
this._createdBy = createdBy;
}
if (lastEditedBy != null) {
this._lastEditedBy = lastEditedBy;
}
if (hasChildren != null) {
this._hasChildren = hasChildren;
}
if (archived != null) {
this._archived = archived;
}
if (type != null) {
this._type = type;
}
if (paragraph != null) {
this._paragraph = paragraph;
}
if (image != null) {
this._image = image;
}
}

	String? get object => _object;
	set object(String? object) => _object = object;
	String? get id => _id;
	set id(String? id) => _id = id;
	Parent? get parent => _parent;
	set parent(Parent? parent) => _parent = parent;
	String? get createdTime => _createdTime;
	set createdTime(String? createdTime) => _createdTime = createdTime;
	String? get lastEditedTime => _lastEditedTime;
	set lastEditedTime(String? lastEditedTime) => _lastEditedTime = lastEditedTime;
	CreatedBy? get createdBy => _createdBy;
	set createdBy(CreatedBy? createdBy) => _createdBy = createdBy;
	CreatedBy? get lastEditedBy => _lastEditedBy;
	set lastEditedBy(CreatedBy? lastEditedBy) => _lastEditedBy = lastEditedBy;
	bool? get hasChildren => _hasChildren;
	set hasChildren(bool? hasChildren) => _hasChildren = hasChildren;
	bool? get archived => _archived;
	set archived(bool? archived) => _archived = archived;
	String? get type => _type;
	set type(String? type) => _type = type;
	Paragraph? get paragraph => _paragraph;
	set paragraph(Paragraph? paragraph) => _paragraph = paragraph;
	Image? get image => _image;
	set image(Image? image) => _image = image;

	Results.fromJson(Map<String, dynamic> json) {
		_object = json['object'];
		_id = json['id'];
		_parent = json['parent'] != null ? new Parent.fromJson(json['parent']) : null;
		_createdTime = json['created_time'];
		_lastEditedTime = json['last_edited_time'];
		_createdBy = json['created_by'] != null ? new CreatedBy.fromJson(json['created_by']) : null;
		_lastEditedBy = json['last_edited_by'] != null ? new CreatedBy.fromJson(json['last_edited_by']) : null;
		_hasChildren = json['has_children'];
		_archived = json['archived'];
		_type = json['type'];
		_paragraph = json['paragraph'] != null ? new Paragraph.fromJson(json['paragraph']) : null;
	//	_image = json['image'] != null ? new Image.fromJson(json['image']) : null;
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['object'] = this._object;
		data['id'] = this._id;
		if (this._parent != null) {
      data['parent'] = this._parent!.toJson();
    }
		data['created_time'] = this._createdTime;
		data['last_edited_time'] = this._lastEditedTime;
		if (this._createdBy != null) {
      data['created_by'] = this._createdBy!.toJson();
    }
		if (this._lastEditedBy != null) {
      data['last_edited_by'] = this._lastEditedBy!.toJson();
    }
		data['has_children'] = this._hasChildren;
		data['archived'] = this._archived;
		data['type'] = this._type;
		if (this._paragraph != null) {
      data['paragraph'] = this._paragraph!.toJson();
    }
		// if (this._image != null) {
    //   data['image'] = this._image!.toJson();
    // }
		return data;
	}
}

class Parent {
	String? _type;
	String? _pageId;

	Parent({String? type, String? pageId}) {
if (type != null) {
this._type = type;
}
if (pageId != null) {
this._pageId = pageId;
}
}

	String? get type => _type;
	set type(String? type) => _type = type;
	String? get pageId => _pageId;
	set pageId(String? pageId) => _pageId = pageId;

	Parent.fromJson(Map<String, dynamic> json) {
		_type = json['type'];
		_pageId = json['page_id'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['type'] = this._type;
		data['page_id'] = this._pageId;
		return data;
	}
}

class CreatedBy {
	String? _object;
	String? _id;

	CreatedBy({String? object, String? id}) {
if (object != null) {
this._object = object;
}
if (id != null) {
this._id = id;
}
}

	String? get object => _object;
	set object(String? object) => _object = object;
	String? get id => _id;
	set id(String? id) => _id = id;

	CreatedBy.fromJson(Map<String, dynamic> json) {
		_object = json['object'];
		_id = json['id'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['object'] = this._object;
		data['id'] = this._id;
		return data;
	}
}

class Paragraph {
	List<RichText>? _richText;
	String? _color;

	Paragraph({List<RichText>? richText, String? color}) {
if (richText != null) {
this._richText = richText;
}
if (color != null) {
this._color = color;
}
}

	List<RichText>? get richText => _richText;
	set richText(List<RichText>? richText) => _richText = richText;
	String? get color => _color;
	set color(String? color) => _color = color;

	Paragraph.fromJson(Map<String, dynamic> json) {
		if (json['rich_text'] != null) {
			_richText = <RichText>[];
			json['rich_text'].forEach((v) { _richText!.add(new RichText.fromJson(v)); });
		}
		_color = json['color'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		if (this._richText != null) {
      data['rich_text'] = this._richText!.map((v) => v.toJson()).toList();
    }
		data['color'] = this._color;
		return data;
	}
}

class RichText {
	String? _type;
	Text? _text;
	Annotations? _annotations;
	String? _plainText;
	Null? _href;

	RichText({String? type, Text? text, Annotations? annotations, String? plainText, Null? href}) {
if (type != null) {
this._type = type;
}
if (text != null) {
this._text = text;
}
if (annotations != null) {
this._annotations = annotations;
}
if (plainText != null) {
this._plainText = plainText;
}
if (href != null) {
this._href = href;
}
}

	String? get type => _type;
	set type(String? type) => _type = type;
	Text? get text => _text;
	set text(Text? text) => _text = text;
	Annotations? get annotations => _annotations;
	set annotations(Annotations? annotations) => _annotations = annotations;
	String? get plainText => _plainText;
	set plainText(String? plainText) => _plainText = plainText;
	Null? get href => _href;
	set href(Null? href) => _href = href;

	RichText.fromJson(Map<String, dynamic> json) {
		_type = json['type'];
		_text = json['text'] != null ? new Text.fromJson(json['text']) : null;
		_annotations = json['annotations'] != null ? new Annotations.fromJson(json['annotations']) : null;
		_plainText = json['plain_text'];
		_href = json['href'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['type'] = this._type;
		if (this._text != null) {
      data['text'] = this._text!.toJson();
    }
		if (this._annotations != null) {
      data['annotations'] = this._annotations!.toJson();
    }
		data['plain_text'] = this._plainText;
		data['href'] = this._href;
		return data;
	}
}

class Text {
	String? _content;
	Null? _link;

	Text({String? content, Null? link}) {
if (content != null) {
this._content = content;
}
if (link != null) {
this._link = link;
}
}

	String? get content => _content;
	set content(String? content) => _content = content;
	Null? get link => _link;
	set link(Null? link) => _link = link;

	Text.fromJson(Map<String, dynamic> json) {
		_content = json['content'];
		_link = json['link'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['content'] = this._content;
		data['link'] = this._link;
		return data;
	}
}

class Annotations {
	bool? _bold;
	bool? _italic;
	bool? _strikethrough;
	bool? _underline;
	bool? _code;
	String? _color;

	Annotations({bool? bold, bool? italic, bool? strikethrough, bool? underline, bool? code, String? color}) {
if (bold != null) {
this._bold = bold;
}
if (italic != null) {
this._italic = italic;
}
if (strikethrough != null) {
this._strikethrough = strikethrough;
}
if (underline != null) {
this._underline = underline;
}
if (code != null) {
this._code = code;
}
if (color != null) {
this._color = color;
}
}

	bool? get bold => _bold;
	set bold(bool? bold) => _bold = bold;
	bool? get italic => _italic;
	set italic(bool? italic) => _italic = italic;
	bool? get strikethrough => _strikethrough;
	set strikethrough(bool? strikethrough) => _strikethrough = strikethrough;
	bool? get underline => _underline;
	set underline(bool? underline) => _underline = underline;
	bool? get code => _code;
	set code(bool? code) => _code = code;
	String? get color => _color;
	set color(String? color) => _color = color;

	Annotations.fromJson(Map<String, dynamic> json) {
		_bold = json['bold'];
		_italic = json['italic'];
		_strikethrough = json['strikethrough'];
		_underline = json['underline'];
		_code = json['code'];
		_color = json['color'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['bold'] = this._bold;
		data['italic'] = this._italic;
		data['strikethrough'] = this._strikethrough;
		data['underline'] = this._underline;
		data['code'] = this._code;
		data['color'] = this._color;
		return data;
	}
}

class Image {
	List<Null>? _caption;
	String? _type;
	File? _file;

	Image({List<Null>? caption, String? type, File? file}) {
if (caption != null) {
this._caption = caption;
}
if (type != null) {
this._type = type;
}
if (file != null) {
this._file = file;
}
}

	List<Null>? get caption => _caption;
	set caption(List<Null>? caption) => _caption = caption;
	String? get type => _type;
	set type(String? type) => _type = type;
	File? get file => _file;
	set file(File? file) => _file = file;

	// Image.fromJson(Map<String, dynamic> json) {
	// 	if (json['caption'] != null) {
	// 		_caption = <Null>[];
	// 		json['caption'].forEach((v) { _caption!.add(new Null.fromJson(v)); });
	// 	}
	// 	_type = json['type'];
	// 	_file = json['file'] != null ? new File.fromJson(json['file']) : null;
	// }

	// Map<String, dynamic> toJson() {
	// 	final Map<String, dynamic> data = new Map<String, dynamic>();
	// 	if (this._caption != null) {
  //     data['caption'] = this._caption!.map((v) => v.toJson()).toList();
  //   }
	// 	data['type'] = this._type;
	// 	if (this._file != null) {
  //     data['file'] = this._file!.toJson();
  //   }
	// 	return data;
	// }
}

class File {
	String? _url;
	String? _expiryTime;

	File({String? url, String? expiryTime}) {
if (url != null) {
this._url = url;
}
if (expiryTime != null) {
this._expiryTime = expiryTime;
}
}

	String? get url => _url;
	set url(String? url) => _url = url;
	String? get expiryTime => _expiryTime;
	set expiryTime(String? expiryTime) => _expiryTime = expiryTime;

	File.fromJson(Map<String, dynamic> json) {
		_url = json['url'];
		_expiryTime = json['expiry_time'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['url'] = this._url;
		data['expiry_time'] = this._expiryTime;
		return data;
	}
}

// class Block {


// 	Block({}) {
// }



// 	Block.fromJson(Map<String, dynamic> json) {
// 	}

// 	Map<String, dynamic> toJson() {
// 		final Map<String, dynamic> data = new Map<String, dynamic>();
// 		return data;
// 	}
// }

