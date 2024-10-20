package phuc.dev;

import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

public class VNPayPayment {

    public static String generatePaymentUrl(double amount, String orderInfo, String ipAddress) throws Exception {
        // Tạo tham số thanh toán
        Map<String, String> params = new HashMap<>();
        params.put("vnp_Version", "2.0.0");
        params.put("vnp_Command", "pay");
        params.put("vnp_TmnCode", VNPayConfig.TMN_CODE);
        params.put("vnp_Amount", String.valueOf((int) (amount * 100))); // Số tiền (đơn vị đồng)
        params.put("vnp_CurrCode", "VND");
        params.put("vnp_TxnRef", String.valueOf(System.currentTimeMillis())); // Mã giao dịch
        params.put("vnp_OrderInfo", orderInfo);
        params.put("vnp_Locale", "vn");
        params.put("vnp_IpAddr", ipAddress);
        params.put("vnp_CreateDate", String.valueOf(System.currentTimeMillis()));

        // Tạo chữ ký
        String signature = generateSignature(params);
        params.put("vnp_SecureHash", signature);

        // Tạo URL
        StringBuilder url = new StringBuilder(VNPayConfig.VNP_URL + "?");
        for (Map.Entry<String, String> entry : params.entrySet()) {
            url.append(entry.getKey()).append("=").append(URLEncoder.encode(entry.getValue(), "UTF-8")).append("&");
        }
        url.deleteCharAt(url.length() - 1); // Xóa dấu "&" cuối cùng

        return url.toString();
    }

    private static String generateSignature(Map<String, String> params) throws Exception {
        // Xây dựng chuỗi để tạo chữ ký
        StringBuilder sb = new StringBuilder();
        params.entrySet().stream()
                .sorted(Map.Entry.comparingByKey())
                .forEach(entry -> {
                    if (!entry.getKey().equals("vnp_SecureHash") && entry.getValue() != null) {
                        sb.append(entry.getKey()).append("=").append(entry.getValue()).append("&");
                    }
                });
        String data = sb.toString();
        // Tạo chữ ký bằng cách mã hóa HMAC với SHA256
        return HMACUtils.hmacSHA256(VNPayConfig.SECRET_KEY, data);
    }
}
