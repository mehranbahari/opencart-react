import "./SliderTop.css";
import "swiper/css";

import SwiperCore, {
  Navigation,
  Pagination,
  Scrollbar,
  A11y,
  EffectCoverflow,
} from "swiper/core";
import { Swiper, SwiperSlide } from "swiper/react";
import "swiper/swiper-bundle.min.css";
import "swiper/swiper.min.css";

SwiperCore.use([Navigation, Pagination, Scrollbar, A11y, EffectCoverflow]);

import imgS1 from "../assets/images/slider01.jpg";
import imgS2 from "../assets/images/slider02.jpg";
import imgS3 from "../assets/images/slider03.jpg";

const SliderTop = () => {
  return (
    <div className="slider-top container">
      <Swiper
        navigation
        effect={"coverflow"}
        slidesPerView={Window.innerWidth < 768 ? 1 : 1}
        //   breakpoints={{
        //     768: {
        //       slidesPerView: 3,
        //     },
        //     1280: {
        //       slidesPerView: 1,
        //     },
        //   }}
        pagination={{ clickable: true }}
        loop={true}
        centeredSlides={true}
        coverflowEffect={{
          rotate: 50,
          stretch: 0,
          depth: 100,
          modifier: 1,
          slideShadows: true,
        }}
      >
        <SwiperSlide>
          <img src={imgS1} alt="" className="swiperSlideDiv " />
        </SwiperSlide>
        <SwiperSlide>
          <img src={imgS2} alt="" className="swiperSlideDiv " />
        </SwiperSlide>
        {/* <SwiperSlide>
          <img src={imgS3} alt="" className="swiperSlideDiv " />
        </SwiperSlide> */}
      </Swiper>
    </div>
  );
};
export default SliderTop;
