package com.it2299.reincoast.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.search.FullTextQuery;
import org.hibernate.search.FullTextSession;
import org.hibernate.search.Search;
import org.hibernate.search.query.dsl.MustJunction;
import org.hibernate.search.query.dsl.QueryBuilder;
import org.hibernate.search.query.dsl.TermMatchingContext;

import com.it2299.ffth.reincoast.dto.Product;
import com.it2299.ffth.reincoast.util.HibernateUtil;

/**
 * Servlet implementation class ProductSearchServlet
 */
@WebServlet("/ProductSearchServlet")
public class ProductSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ProductSearchServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		try {

			String[] keywordOptions = request.getParameterValues("s_keyword_options");
			String keyword = request.getParameter("s_keyword");
			String category = request.getParameter("s_category");
			String priceOption = request.getParameter("s_price_option");
			Double price = tryParseDouble(request.getParameter("s_price"));
			Double priceTo = tryParseDouble(request.getParameter("s_price_to"));
			String weightOption = request.getParameter("s_weight_option");
			Double weight = tryParseDouble(request.getParameter("s_weight"));
			Double weightTo = tryParseDouble(request.getParameter("s_weight_to"));
			String stockOption = request.getParameter("s_stock_option");
			Integer stock = tryParseInteger(request.getParameter("s_stock"));
			Integer stockTo = tryParseInteger(request.getParameter("s_stock_to"));
			String[] metaKeys = request.getParameterValues("s_meta_key");
			String[] metaValues = request.getParameterValues("s_meta_value");
			// double stock =
			// Double.parseDouble(request.getParameter("s_stock"));
			// double stockTo =
			// Double.parseDouble(request.getParameter("s_stock_to"));

			// save inputs to request scope to pass them later to the
			// ProductListServlet
			// Using RequestDispatcher to another servlet/jsp will cause the
			// page to be rerendered
			// Setting autocomplete="on" attribute on html form to cache user
			// input will not work
			request.setAttribute("s_keyword_options", keywordOptions);
			request.setAttribute("s_keyword", keyword);
			request.setAttribute("s_category", category);
			request.setAttribute("s_price_option", priceOption);
			request.setAttribute("s_price", price);
			request.setAttribute("s_price_to", priceTo);
			request.setAttribute("s_weight_option", weightOption);
			request.setAttribute("s_weight", weight);
			request.setAttribute("s_weight_to", weightTo);
			request.setAttribute("s_stock_option", stockOption);
			request.setAttribute("s_stock", stock);
			request.setAttribute("s_stock_to", stockTo);
			request.setAttribute("s_meta_key", metaKeys);
			request.setAttribute("s_meta_value", metaValues);

			SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
			Session session = sessionFactory.openSession();

			FullTextSession fullTextSession = Search.getFullTextSession(session);

			// build index
			fullTextSession.createIndexer().startAndWait();

			QueryBuilder queryBuilder = fullTextSession.getSearchFactory().buildQueryBuilder().forEntity(Product.class).get();

			// keyword
			org.apache.lucene.search.Query keywordQuery = null;
			if (keyword != null) {
				if (!keyword.isEmpty()) {
					if (keywordOptions != null) {
						if (keyword.contains("*") || keyword.contains("?")) {
							TermMatchingContext termMatchingContext = null;
							for (int i = 0; i < keywordOptions.length; i++) {
								if (i == 0) {
									termMatchingContext = queryBuilder.keyword().wildcard().onField(keywordOptions[i]);
								} else {
									termMatchingContext = termMatchingContext.andField(keywordOptions[i]);
								}
							}
							keywordQuery = termMatchingContext.matching(keyword).createQuery();
						} else {
							keywordQuery = queryBuilder.keyword().onFields(keywordOptions).matching(keyword).createQuery();
						}
					} else {
						keywordQuery = queryBuilder.all().except(queryBuilder.all().createQuery()).createQuery();
					}
				} else {
					keywordQuery = queryBuilder.all().createQuery();
				}
			} else {
				keywordQuery = queryBuilder.all().createQuery();
			}

			// category
			org.apache.lucene.search.Query categoryQuery = null;
			if (category != null) {
				if (!category.isEmpty()) {
					categoryQuery = queryBuilder.keyword().onField("category").matching(category).createQuery();
				} else {
					categoryQuery = queryBuilder.all().createQuery();
				}
			} else {
				categoryQuery = queryBuilder.all().createQuery();
			}

			// price
			org.apache.lucene.search.Query priceQuery = null;
			if (price != null) {
				switch (priceOption) {
				case "LESS_THAN":
					priceQuery = queryBuilder.range().onField("price").below(price).excludeLimit().createQuery();
					break;
				case "LESS_THAN_OR_EQUAL":
					priceQuery = queryBuilder.range().onField("price").below(price).createQuery();
					break;
				case "EQUAL":
					priceQuery = queryBuilder.range().onField("price").from(price).to(price).createQuery();
					break;
				case "MORE_THAN_OR_EQUAL":
					priceQuery = queryBuilder.range().onField("price").above(price).createQuery();
					break;
				case "MORE_THAN":
					priceQuery = queryBuilder.range().onField("price").above(price).excludeLimit().createQuery();
					break;
				case "BETWEEN":
					if (priceTo != null) {
						priceQuery = queryBuilder.range().onField("price").from(price).to(priceTo).createQuery();
					} else {
						priceQuery = queryBuilder.all().createQuery();
					}
					break;
				default:
					priceQuery = queryBuilder.all().createQuery();
					break;
				}
			} else {
				priceQuery = queryBuilder.all().createQuery();
			}

			// weight
			org.apache.lucene.search.Query weightQuery = null;
			if (weight != null) {
				switch (weightOption) {
				case "LESS_THAN":
					weightQuery = queryBuilder.range().onField("weight").below(weight).excludeLimit().createQuery();
					break;
				case "LESS_THAN_OR_EQUAL":
					weightQuery = queryBuilder.range().onField("weight").below(weight).createQuery();
					break;
				case "EQUAL":
					weightQuery = queryBuilder.range().onField("weight").from(weight).to(weight).createQuery();
					break;
				case "MORE_THAN_OR_EQUAL":
					weightQuery = queryBuilder.range().onField("weight").above(weight).createQuery();
					break;
				case "MORE_THAN":
					weightQuery = queryBuilder.range().onField("weight").above(weight).excludeLimit().createQuery();
					break;
				case "BETWEEN":
					if (weightTo != null) {
						weightQuery = queryBuilder.range().onField("weight").from(weight).to(weightTo).createQuery();
					} else {
						weightQuery = queryBuilder.all().createQuery();
					}
					break;
				default:
					weightQuery = queryBuilder.all().createQuery();
					break;
				}
			} else {
				weightQuery = queryBuilder.all().createQuery();
			}
			
			// stock
			org.apache.lucene.search.Query stockQuery = null;
			if (stock != null) {
				switch (stockOption) {
				case "LESS_THAN":
					stockQuery = queryBuilder.range().onField("quantity").below(stock).excludeLimit().createQuery();
					break;
				case "LESS_THAN_OR_EQUAL":
					stockQuery = queryBuilder.range().onField("quantity").below(stock).createQuery();
					break;
				case "EQUAL":
					stockQuery = queryBuilder.range().onField("quantity").from(stock).to(stock).createQuery();
					break;
				case "MORE_THAN_OR_EQUAL":
					stockQuery = queryBuilder.range().onField("quantity").above(stock).createQuery();
					break;
				case "MORE_THAN":
					stockQuery = queryBuilder.range().onField("quantity").above(stock).excludeLimit().createQuery();
					break;
				case "BETWEEN":
					if (stockTo != null) {
						stockQuery = queryBuilder.range().onField("quantity").from(stock).to(stockTo).createQuery();
					} else {
						stockQuery = queryBuilder.all().createQuery();
					}
					break;
				default:
					stockQuery = queryBuilder.all().createQuery();
					break;
				}
			} else {
				stockQuery = queryBuilder.all().createQuery();
			}

			// additional data (metaKey)
			List<org.apache.lucene.search.Query> metaKeyQueries = new ArrayList<org.apache.lucene.search.Query>();
			if (metaKeys != null) {
				for (String metaKey : metaKeys) {
					if (!metaKey.isEmpty()) {
						org.apache.lucene.search.Query metaKeyQuery = null;
						metaKeyQuery = queryBuilder.phrase().onField("productMetas.metaKey").sentence(metaKey).createQuery();
						
						metaKeyQueries.add(metaKeyQuery);
					} else {
						org.apache.lucene.search.Query metaKeyQuery = null;
						metaKeyQuery = queryBuilder.all().createQuery();
						
						metaKeyQueries.add(metaKeyQuery);
					}
				}
			} else {
				org.apache.lucene.search.Query metaKeyQuery = null;
				metaKeyQuery = queryBuilder.all().createQuery();
				
				metaKeyQueries.add(metaKeyQuery);
			}

			// additional data (metaValue)
			List<org.apache.lucene.search.Query> metaValueQueries = new ArrayList<org.apache.lucene.search.Query>();
			if (metaValues != null) {
				for (String metaValue : metaValues) {
					if (!metaValue.isEmpty()) {
						org.apache.lucene.search.Query metaValueQuery = null;
						metaValueQuery = queryBuilder.keyword().onField("productMetas.metaValue").matching(metaValue).createQuery();
						
						metaValueQueries.add(metaValueQuery);
					} else {
						org.apache.lucene.search.Query metaValueQuery = null;
						metaValueQuery = queryBuilder.all().createQuery();
						
						metaValueQueries.add(metaValueQuery);
					}
				}
			} else {
				org.apache.lucene.search.Query metaValueQuery = null;
				metaValueQuery = queryBuilder.all().createQuery();
				
				metaValueQueries.add(metaValueQuery);
			}

			// combined criteria			
			MustJunction partialJunction = queryBuilder.bool().must(keywordQuery).must(categoryQuery).must(priceQuery).must(weightQuery).must(stockQuery);
			for(org.apache.lucene.search.Query metaKeyQuery : metaKeyQueries){
				partialJunction.must(metaKeyQuery);
			}
			for(org.apache.lucene.search.Query metaValueQuery : metaValueQueries){
				partialJunction.must(metaValueQuery);
			}
			
			org.apache.lucene.search.Query combinedQuery = partialJunction.createQuery();
			org.hibernate.Query hibernateQuery = fullTextSession.createFullTextQuery(combinedQuery, Product.class);
			int page;
			try {
				page = Integer.parseInt(request.getParameter("page"));
			} catch (Exception ex) {
				page = 1;
			}
			hibernateQuery.setFirstResult(10 * (page - 1));
			hibernateQuery.setMaxResults(10);

			List<Product> products = new ArrayList<Product>();
			products = hibernateQuery.list();

			request.setAttribute("products", products);
			request.setAttribute("s_matching_total", ((FullTextQuery) hibernateQuery).getResultSize());
			if (request.getQueryString().contains("&page=")) {
				request.setAttribute("s_url", request.getRequestURL().append('?').append(request.getQueryString().substring(0, request.getQueryString().indexOf("&page="))));
				request.setAttribute("s_current_page", Integer.parseInt(request.getParameter("page")));
				request.setAttribute("s_record_from", Math.min(1 + (Integer.parseInt(request.getParameter("page")) - 1) * 10, ((FullTextQuery) hibernateQuery).getResultSize()));
				request.setAttribute("s_record_to", Math.min(Integer.parseInt(request.getParameter("page")) * 10, ((FullTextQuery) hibernateQuery).getResultSize()));
			} else {
				request.setAttribute("s_url", request.getRequestURL().append('?').append(request.getQueryString()));
				request.setAttribute("s_current_page", 1);
				request.setAttribute("s_record_from", Math.min(1, ((FullTextQuery) hibernateQuery).getResultSize()));
				request.setAttribute("s_record_to", Math.min(10, ((FullTextQuery) hibernateQuery).getResultSize()));
			}

			fullTextSession.close();

			RequestDispatcher requestDispatcher = request.getRequestDispatcher("ProductListServlet");
			requestDispatcher.forward(request, response);

		} catch (Exception ex) {
			ex.printStackTrace();
		}

	}

	private Double tryParseDouble(String value) {
		try {
			return Double.parseDouble(value);
		} catch (Exception ex) {
			ex.printStackTrace();
			return null;
		}
	}
	
	private Integer tryParseInteger(String value) {
		try {
			return Integer.parseInt(value);
		} catch (Exception ex) {
			ex.printStackTrace();
			return null;
		}
	}

}
