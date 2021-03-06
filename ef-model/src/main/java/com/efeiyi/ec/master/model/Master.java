package com.efeiyi.ec.master.model;

import com.efeiyi.ec.organization.model.AddressProvince;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.ming800.core.base.model.BaseMaster;
import com.ming800.core.base.model.BaseMasterUser;
import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Where;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;
import java.util.List;


/**
 * Created by IntelliJ IDEA.
 * User: ming
 * Date: 12-10-15
 * Time: 上午11:06
 * To change this template use File | Settings | File Templates.
 */

@Entity
@Table(name = "master")
@JsonIgnoreProperties(value = {"hibernateLazyInitializer", "handler"})
public class Master implements Serializable,Comparable,BaseMaster {

    private String id;
    private String name;//名称标识
    private String fullName; //中文名
    private String brief; // 简介(短)
    private String title; // 头衔/称号
    private String favicon; //网站头像
    private String sex; //性别
    private String birthday; //出生年月
    private String level; //等级
    private String content; // 简介(长)
    private String presentAddress; //现居地
    private String backgroundUrl;
    private String provinceName;//籍贯
    private AddressProvince originProvince; //籍贯（省）
    private String status;         // 正常，删除，停止，隐藏
    private String logoUrl;
    private Date createDateTime;
    private List<MasterProject> masterProjectList;
    private List<MasterRecommended> masterRecommendedList;//推荐
    private String projectName ;
    private String levelName;
    private String masterSpeech;
    private Long fsAmount;
    private String cityName;
    private String followStatus;
    private  String review;//审核 1:未审核 2:正在审核 3:审核失败 4:审核成功
    private String identityCard;
    private String identityPicture;

    @Transient
    public String getFollowStatus() {
        return followStatus;
    }

    public void setFollowStatus(String followStatus) {
        this.followStatus = followStatus;
    }

    @Column(name = "master_speech")
    public String getMasterSpeech() {
        return masterSpeech;
    }

    public void setMasterSpeech(String masterSpeech) {
        this.masterSpeech = masterSpeech;
    }

    @Transient
    public String getCityName() {
        return cityName;
    }

    public void setCityName(String cityName) {
        this.cityName = cityName;
    }

    @Transient
    public String getProjectName() {
        return projectName;
    }

    public void setProjectName(String projectName) {
        this.projectName = projectName;
    }

    @JsonIgnore
    @Transient
    public MasterProject getMainProjectName() {
        List<MasterProject>  masterProjectList = getMasterProjectList();
        MasterProject mainProject = null;
        for (MasterProject project : masterProjectList){
            if (project.getStatus().equals("1")){
                mainProject = project;
            }
        }
        return mainProject;
    }

    @JsonIgnore
    @OneToMany(fetch = FetchType.LAZY, mappedBy = "master")
    public List<MasterProject> getMasterProjectList() {
        return masterProjectList;
    }

    public void setMasterProjectList(List<MasterProject> masterProjectList) {
        this.masterProjectList = masterProjectList;
    }

    @Id
    @GenericGenerator(name = "id", strategy = "com.ming800.core.p.model.M8idGenerator")
    @GeneratedValue(generator = "id")
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    @Column(name = "name")
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Column(name = "status")
    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }


    @Column(name = "create_datetime")
    public Date getCreateDateTime() {
        return createDateTime;
    }

    public void setCreateDateTime(Date createDateTime) {
        this.createDateTime = createDateTime;
    }

    @Column(name = "full_name")
    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    @Column(name = "brief")
    public String getBrief() {
        return brief;
    }

    public void setBrief(String brief) {
        this.brief = brief;
    }

    @Column(name = "title")
    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    @Column(name = "favicon")
    public String getFavicon() {
        return favicon;
    }

    public void setFavicon(String favicon) {
        this.favicon = favicon;
    }

    @Column(name = "content")
    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    @Column(name = "sex")
    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    @Column(name = "birthday")
    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    @Column(name = "level")
    public String getLevel() {
        return level;
    }

    public void setLevel(String level) {
        this.level = level;
    }

    @Column(name = "present_address")
    public String getPresentAddress() {
        return presentAddress;
    }

    public void setPresentAddress(String presentAddress) {
        this.presentAddress = presentAddress;
    }

    @Column(name = "fans_amount")
    public Long getFsAmount() {
        return fsAmount;
    }

    public void setFsAmount(Long fsAmount) {
        this.fsAmount = fsAmount;
    }

    @JsonIgnore
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "origin_province_id")
    public AddressProvince getOriginProvince() {
        return originProvince;
    }

    public void setOriginProvince(AddressProvince originProvince) {
        this.originProvince = originProvince;
    }

    @Column(name = "background_url")
    public String getBackgroundUrl() {
        return backgroundUrl;
    }

    public void setBackgroundUrl(String backgroundUrl) {
        this.backgroundUrl = backgroundUrl;
    }

    @Column(name = "province_name")
    public String getProvinceName() {
        return provinceName;
    }

    public void setProvinceName(String provinceName) {
        this.provinceName = provinceName;
    }

    @Column(name = "logo_url")
    public String getLogoUrl() {
        return logoUrl;
    }

    public void setLogoUrl(String logoUrl) {
        this.logoUrl = logoUrl;
    }

    @JsonIgnore
    @OneToMany(fetch = FetchType.LAZY,mappedBy = "master")
    @Where(clause = "status=1")
    public List<MasterRecommended> getMasterRecommendedList() {
        return masterRecommendedList;
    }

    public void setMasterRecommendedList(List<MasterRecommended> masterRecommendedList) {
        this.masterRecommendedList = masterRecommendedList;
    }

    @Override
    public String toString(){
        return  "Master{id = "+id+"}";
    }


    @Override
    public int compareTo(Object o) {
        if(o==null){
          return -1;
         }
        if (!(o instanceof Master)){
            return -1;
        }
        if (o.hashCode()!=this.hashCode()){
            return -1;
        }
        if (this.getId().equals(((Master) o).getId())
                && this.fullName.equals(((Master) o).getFullName())){
            return 0;
        }
      return  -1;
    }

    @Column(name = "review_status")
    public String getReview() {
        return review;
    }

    public void setReview(String review) {
        this.review = review;
    }

    @Column(name = "identity_card")
    public String getIdentityCard() {
        return identityCard;
    }

    public void setIdentityCard(String identityCard) {
        this.identityCard = identityCard;
    }

    @Column(name = "identity_pic")
    public String getIdentityPicture() {
        return identityPicture;
    }

    public void setIdentityPicture(String identityPicture) {
        this.identityPicture = identityPicture;
    }
}
