"use client";

import { useRef, useState } from "react";
import type { ItemModalProps } from "./types";

export function ItemModal({
  item,
  onClose,
  onAdd,
  spicyLabel,
  priceLabel,
  addToOrderLabel,
}: ItemModalProps) {
  const isOpen = item !== null;
  const topBg = item?.fill === "orange-fill" ? "#e35d07" : "#395748";

  const sheetRef = useRef<HTMLDivElement>(null);
  const dragStartY = useRef<number | null>(null);
  const [dragOffset, setDragOffset] = useState(0);
  const isDragging = useRef(false);

  function handleDragStart(clientY: number) {
    dragStartY.current = clientY;
    isDragging.current = true;
  }

  function handleDragMove(clientY: number) {
    if (!isDragging.current || dragStartY.current === null) return;
    const delta = clientY - dragStartY.current;
    setDragOffset(Math.max(0, delta));
  }

  function handleDragEnd() {
    if (!isDragging.current) return;
    isDragging.current = false;
    const threshold = 120;
    if (dragOffset >= threshold) {
      setDragOffset(0);
      dragStartY.current = null;
      onClose();
    } else {
      setDragOffset(0);
      dragStartY.current = null;
    }
  }

  return (
    <div
      className={[
        "absolute inset-x-0 top-0 bottom-8 bg-[rgba(31,46,38,0.78)] items-end justify-center z-[1000]",
        isOpen ? "flex" : "hidden",
      ].join(" ")}
      onClick={(e) => { if (e.target === e.currentTarget) onClose(); }}
      onMouseMove={(e) => handleDragMove(e.clientY)}
      onMouseUp={() => handleDragEnd()}
      onTouchMove={(e) => handleDragMove(e.touches[0].clientY)}
      onTouchEnd={() => handleDragEnd()}
    >
      {item && (
        <div
          ref={sheetRef}
          className="w-full bg-bg border-t-4 border-green animate-[slideUp_0.25s_cubic-bezier(0.2,0.8,0.2,1)] max-h-[78%] overflow-hidden flex flex-col relative cursor-grab active:cursor-grabbing select-none"
          style={{
            transform: `translateY(${dragOffset}px)`,
            transition: isDragging.current ? "none" : "transform 0.25s cubic-bezier(0.2,0.8,0.2,1)",
          }}
          onMouseDown={(e) => { e.preventDefault(); handleDragStart(e.clientY); }}
          onTouchStart={(e) => handleDragStart(e.touches[0].clientY)}
        >
          {/* Drag handle indicator */}
          <div className="flex justify-center items-center pt-2.5 pb-1 shrink-0">
            <div className="w-10 h-1 rounded-full bg-green/30" />
          </div>

          <button
            type="button"
            onClick={onClose}
            className="absolute top-2 right-2 bg-orange text-white border-0 w-[34px] h-[34px] font-bowlby text-[18px] cursor-pointer z-5 grid place-items-center"
          >
            ×
          </button>
          <div className="grid place-items-center aspect-video shrink-0 overflow-hidden" style={{ background: topBg }}>
            {item.image_url ? (
              // eslint-disable-next-line @next/next/no-img-element
              <img src={item.image_url} alt="" className="w-full h-full object-cover" />
            ) : (
              <span className="text-[96px] leading-none p-4.5">{item.emoji}</span>
            )}
          </div>
          <div className="px-4.5 pt-4 pb-4.5 flex-1 overflow-auto">
            <div className="font-extrabold text-[9px] tracking-[0.28em] text-orange uppercase mb-1.5">
              {item.cat}{item.spicy ? ` · 🌶 ${spicyLabel}` : ""}
            </div>
            <div className="font-bowlby text-[30px] leading-[0.92] text-ink uppercase tracking-[-0.8px] mb-2.5">
              {item.name}
            </div>
            {item.hook && (
              <div className="font-bold text-[11px] tracking-[0.18em] text-ink/70 uppercase mb-2">
                {item.hook}
              </div>
            )}
            {item.desc && (
              <div className="text-[12px] leading-relaxed text-ink/65 mb-3.5">
                {item.desc}
              </div>
            )}
            <div className="flex justify-between items-center py-2.5 border-t-2 border-b-2 border-green mb-3.5">
              <span className="font-extrabold text-[9px] tracking-[0.28em] text-ink/60 uppercase">{priceLabel}</span>
              <span className="font-bowlby text-[24px] text-orange">{item.price} ₺</span>
            </div>
            <button
              type="button"
              onClick={onAdd}
              className="w-full bg-orange text-white border-0 py-3.5 font-bowlby text-[16px] tracking-[1.5px] uppercase cursor-pointer"
            >
              {addToOrderLabel}
            </button>
          </div>
        </div>
      )}
    </div>
  );
}
