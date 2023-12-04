//
//  WriteVC.swift
//  BEUS
//
//  Created by 티모시 킴 on 12/4/23.
//

import UIKit

import Photos

final class WriteVC: UIViewController {
    
    var titleText: String?
    var contentText: String?
    var isAnonymousSelected = false
    var modify: Bool = false
    var selectedImages: [UIImage?] = []
    var originalImages: [UIImage?] = []
    
    private lazy var completeButton = UIButton()
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    private let cameraButton = UIButton()
    private lazy var imagesStackView = UIStackView()
    private let titleLabel = UILabel()
    private let titleContainerView = UIView()
    private var titleTextField = UITextField()
    private let contentLabel = UILabel()
    private let contentContainerView = UIView()
    private let anonymousImageButton = UIButton()
    private lazy var contentTextView = UITextView()
    private let ruleLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "글 쓰기"
        view.backgroundColor = .white
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: completeButton)
        setUI()
        handleEdit()
    }

}

extension WriteVC {
    
    private func setUI() {
        setStyle()
        setLayout()
    }
    
    private func setStyle() {
        completeButton.do {
            $0.setTitle("완료", for: .normal)
            $0.backgroundColor = #colorLiteral(red: 0.5215686275, green: 0.8392156863, blue: 0.6509803922, alpha: 1)
            $0.setTitleColor(.white, for: .normal)
            $0.addTarget(self, action: #selector(completeButtonTapped), for: .touchUpInside)
            $0.layer.cornerRadius = 15
            $0.frame.size.width = 50
        }
        
        cameraButton.do {
            $0.setImage(UIImage(systemName: "camera.fill"), for: .normal)
            $0.addTarget(self, action: #selector(cameraButtonTapped), for: .touchUpInside)
        }
        
        imagesStackView.do {
            $0.axis = .horizontal
            $0.spacing = 8
            $0.alignment = .leading
        }
        
        titleLabel.do {
            $0.text = "제목"
            $0.font = UIFont.boldSystemFont(ofSize: 18)
        }
        
        titleContainerView.do {
            $0.backgroundColor = #colorLiteral(red: 0.9656803012, green: 0.965680182, blue: 0.965680182, alpha: 1)
        }
        
        titleTextField.do {
            $0.attributedPlaceholder = NSAttributedString(string: "제목을 입력하세요.", attributes: [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.824265182, green: 0.8242650628, blue: 0.8242650628, alpha: 1), NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15)])
        }
        
        contentLabel.do {
            $0.text = "내용"
            $0.font = UIFont.boldSystemFont(ofSize: 18)
        }
        
        contentContainerView.do {
            $0.backgroundColor = #colorLiteral(red: 0.9656803012, green: 0.965680182, blue: 0.965680182, alpha: 1)
        }
        
        anonymousImageButton.do {
            $0.setImage(UIImage(systemName: "checkmark.square"), for: .normal)
            $0.addTarget(self, action: #selector(anonymousImageButtonTapped), for: .touchUpInside)
        }
        
        contentTextView.do {
            $0.font = UIFont.systemFont(ofSize: 15)
            $0.textColor = .placeholderText
            $0.text = "내용을 입력하세요."
            $0.backgroundColor = .clear
            $0.delegate = self
        }
        
        ruleLabel.do {
            $0.text = "BE:US는 누구나 기분 좋게 참여할 수 있는 커뮤니티를 만들기 위해 이용규칙을 제정하여 운영하고 있습니다.\n\n실명 언급이나 욕, 비방글 작성 시 게시물이 삭제되고 서비스 이용이 일정 기간 제한될 수 있습니다. 적당한 선을 지켜주세요.\n\n태그를 사용해 글을 쓰고 싶으시면 직접 ‘#’ 추가 후 작성해주시고, 검색할 때도 “# + ‘검색어’ ”의 형태로 입력해주시면 됩니다."
            $0.font = UIFont.systemFont(ofSize: 15)
            $0.textColor = #colorLiteral(red: 0.824265182, green: 0.8242650628, blue: 0.8242650628, alpha: 1)
            $0.numberOfLines = 0
        }
    }
    
    private func setLayout() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubviews(cameraButton, imagesStackView, titleLabel, titleContainerView, contentLabel, contentContainerView, ruleLabel)
        titleContainerView.addSubview(titleTextField)
        contentContainerView.addSubviews(contentTextView, anonymousImageButton)
        
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints {
            $0.edges.equalTo(scrollView)
            $0.width.equalTo(scrollView)
            $0.height.greaterThanOrEqualTo(scrollView.snp.height)
        }
        
        cameraButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(20)
            $0.leading.equalToSuperview().inset(30)
            $0.size.equalTo(35)
        }
        
        imagesStackView.snp.makeConstraints {
            $0.top.equalTo(cameraButton.snp.bottom).offset(20)
            $0.leading.equalToSuperview().inset(30)
            $0.height.equalTo(35)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(imagesStackView.snp.bottom).offset(20)
            $0.leading.equalToSuperview().inset(30)
        }
        
        titleContainerView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(5)
            $0.leading.trailing.equalToSuperview().inset(30)
            $0.height.equalTo(40)
        }
        
        titleTextField.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(8)
        }
        
        contentLabel.snp.makeConstraints {
            $0.top.equalTo(titleContainerView.snp.bottom).offset(20)
            $0.leading.equalToSuperview().inset(30)
        }
        
        contentContainerView.snp.makeConstraints {
            $0.top.equalTo(contentLabel.snp.bottom).offset(5)
            $0.leading.trailing.equalToSuperview().inset(30)
            $0.height.equalTo(300)
        }
        
        anonymousImageButton.snp.makeConstraints {
            $0.bottom.trailing.equalToSuperview().inset(8)
            $0.size.equalTo(45)
        }
        
        contentTextView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(8)
            $0.bottom.equalToSuperview().inset(30)
            $0.leading.trailing.equalToSuperview().inset(8)
        }
        
        ruleLabel.snp.makeConstraints {
            $0.top.equalTo(contentContainerView.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(30)
        }
    }
    
    func addRemoveSelectedImage(_ image: UIImage) {
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.widthAnchor.constraint(equalToConstant: 35).isActive = false
        imageView.heightAnchor.constraint(equalToConstant: 35).isActive = false
        imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor, multiplier: 1.0).isActive = true
        
        // 이미지뷰에 탭 제스처를 추가 -> 이미지를 탭할 수 있음
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(removeSelectedImage(_:)))
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(tapGestureRecognizer)
        
        imagesStackView.addArrangedSubview(imageView)
        selectedImages.append(image)
    }
    
    @objc func removeSelectedImage(_ sender: UITapGestureRecognizer) { // 탭한 사진 삭제
        guard let tappedImageView = sender.view as? UIImageView else { return }
        if let index = imagesStackView.arrangedSubviews.firstIndex(of: tappedImageView) {
            imagesStackView.removeArrangedSubview(tappedImageView)
            tappedImageView.removeFromSuperview()
            
            // 이미지가 1개인 경우, Index out of range 에러가 발생하지 않도록 예외 처리
            if selectedImages.count == 1 {
                selectedImages.removeAll()
            } else if index < selectedImages.count {
                selectedImages.remove(at: index)
            }
        }
    }
    
    @objc func completeButtonTapped() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func anonymousImageButtonTapped(_ sender: UIButton) {
        isAnonymousSelected.toggle()
        let imageName = isAnonymousSelected ? "checkmark.square.fill" : "checkmark.square"
        anonymousImageButton.setImage(UIImage(systemName: imageName), for: .normal)
    }
}

extension WriteVC: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        guard textView.textColor == .placeholderText else { return }
        textView.textColor = .label
        textView.text = nil
    }
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "내용을 입력하세요."
            textView.textColor = .placeholderText
        }
    }
}

extension WriteVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @objc func cameraButtonTapped() {
        if selectedImages.count < 6 {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary
            
            if PHPhotoLibrary.authorizationStatus() == .authorized {
                present(imagePicker, animated: true, completion: nil)
            } else {
                PHPhotoLibrary.requestAuthorization { status in
                    if status == .authorized {
                        DispatchQueue.main.async {
                            self.present(imagePicker, animated: true, completion: nil)
                        }
                    } else {
                        let alert = UIAlertController(title: "Error", message: "사진 앱에 접근 권한을 허용해주세요.", preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                        self.present(alert, animated: true, completion: nil)
                    }
                }
            }
        } else {
            let alert = UIAlertController(title: "경고", message: "사진은 최대 6장까지 업로드할 수 있습니다.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "확인", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    // UIImagePickerControllerDelegate 메서드를 구현하여 사용자가 이미지를 선택했을 때 처리
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let selectedImage = info[.originalImage] as? UIImage {
            addRemoveSelectedImage(selectedImage)
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
}
